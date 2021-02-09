import Foundation

final class AreaFilterViewModel {

    func updateAreaIds(areaId: Int) {
        if UserDefaults.areaIds.contains(areaId) {
            UserDefaults.removeAreaId(areaId: areaId)
        } else {
            UserDefaults.areaIds.append(areaId)
        }
    }
}
