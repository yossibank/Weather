import Foundation

final class AreaFilterViewModel {

    func updateAreaIds(areaId: Int) {
        if UserDefaults.areaIds.contains(areaId) {
            UserDefaults.areaIds.remove(value: areaId)
        } else {
            UserDefaults.areaIds.append(areaId)
        }
    }
}
