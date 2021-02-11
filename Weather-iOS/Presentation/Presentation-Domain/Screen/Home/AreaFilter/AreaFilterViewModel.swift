import Foundation

final class AreaFilterViewModel {

    var areaIds: [Int] {
        get {
            UserDefaults.areaIds
        }
        set {
            UserDefaults.areaIds = newValue
        }
    }

    func updateAreaIds(areaId: Int) {
        if areaIds.contains(areaId) {
            areaIds.remove(value: areaId)
        } else {
            areaIds.append(areaId)
        }
    }
}
