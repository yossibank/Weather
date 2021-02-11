import UIKit

final class AreaFilterViewModel: NSObject, UITableViewDataSource {

    var cellData = Area.allCases.map { $0 }

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

extension AreaFilterViewModel {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        cellData.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: AreaFilterTableViewCell.resourceName,
            for: indexPath
        )

        if let areaFilterCell = cell as? AreaFilterTableViewCell,
           let item = cellData.any(at: indexPath.row)
        {
            let image = areaIds.contains(indexPath.row) ?
                Resources.Images.General.checkIn :
                Resources.Images.General.checkOff

            areaFilterCell.checkImageView.image = image
            areaFilterCell.setup(item: item)
        }

        return cell
    }
}
