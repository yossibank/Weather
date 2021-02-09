import Foundation

extension UserDefaults {

    enum Keys: String, CaseIterable {
        case areaIds
    }

    static func accessKey(_ key: Keys) -> String {
        key.rawValue
    }

    static private let userDefaults = UserDefaults.standard

    static var areaIds: [Int] {
        get {
            return userDefaults.array(forKey: accessKey(.areaIds)) as? [Int] ?? []
        }
        set {
            userDefaults.set(newValue, forKey: accessKey(.areaIds))
        }
    }

    static func removeAreaId(areaId: Int) {
        let newValue = areaIds.filter { $0 != areaId }
        areaIds = newValue
    }

    static func removeObject(key: Keys) {
        userDefaults.removeObject(forKey: accessKey(key))
    }
}
