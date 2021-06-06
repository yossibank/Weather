import Foundation

extension UserDefaults {

    enum Keys: String, CaseIterable {
        case prefectureNames
        case areaIds
    }

    static func accessKey(_ key: Keys) -> String {
        key.rawValue
    }

    static private let userDefaults = UserDefaults.standard

    static var prefectureNames: [String] {
        get {
            return userDefaults.array(forKey: accessKey(.prefectureNames)) as? [String] ?? []
        }
        set {
            userDefaults.setValue(newValue, forKey: accessKey(.prefectureNames))
        }
    }

    static var areaIds: [Int] {
        get {
            return userDefaults.array(forKey: accessKey(.areaIds)) as? [Int] ?? []
        }
        set {
            userDefaults.set(newValue, forKey: accessKey(.areaIds))
        }
    }

    static func removeObject(key: Keys) {
        userDefaults.removeObject(forKey: accessKey(key))
    }
}
