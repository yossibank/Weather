import UIKit

final class AreaFilterDataSource: NSObject {
    private weak var viewModel: AreaFilterViewModel?

    init(viewModel: AreaFilterViewModel) {
        super.init()
        self.viewModel = viewModel
    }
}

extension AreaFilterDataSource: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        guard let cellData = viewModel?.areaFilter else { return 0 }
        return cellData.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let viewModel = viewModel else {
            return UITableViewCell(style: .default, reuseIdentifier: nil)
        }

        let cell = tableView.dequeueReusableCell(
            withIdentifier: AreaFilterTableViewCell.resourceName,
            for: indexPath
        )

        if let areaFilterCell = cell as? AreaFilterTableViewCell,
           let item = viewModel.areaFilter.any(at: indexPath.row)
        {
            let image = viewModel.areaIds.contains(indexPath.row) ?
                Resources.Images.General.checkIn :
                Resources.Images.General.checkOff

            areaFilterCell.checkImageView.image = image
            areaFilterCell.setup(item: item)
        }

        return cell
    }
}
