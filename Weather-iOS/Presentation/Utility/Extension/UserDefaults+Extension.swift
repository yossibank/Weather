import Foundation

extension UserDefaults {

    enum Keys: String, CaseIterable {
        case areaId
    }

    static func accessKey(_ key: Keys) -> String {
        key.rawValue
    }

    static private let userDefaults = UserDefaults.standard

    static var areaId: [Int]? {
        get {
            return userDefaults.array(forKey: accessKey(.areaId)) as? [Int]
        }
        set {
            userDefaults.set(newValue, forKey: accessKey(.areaId))
        }
    }
}
