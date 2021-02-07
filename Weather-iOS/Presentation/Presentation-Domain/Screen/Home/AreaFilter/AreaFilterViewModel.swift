final class AreaFilterViewModel {

    var areaList = Area.allCases.compactMap { $0.id }

    func updateAreaIds(areaId: Int) {
        if areaList.contains(areaId) {
            areaList.remove(value: areaId)
        } else {
            areaList.append(areaId)
        }
    }
}
