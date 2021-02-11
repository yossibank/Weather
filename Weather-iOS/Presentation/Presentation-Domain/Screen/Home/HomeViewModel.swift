import UIKit

final class HomeViewModel: NSObject, UITableViewDataSource {
    var cellData = Prefecture.allCases.map { $0 }
}

extension HomeViewModel {

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
            withIdentifier: HomeTableViewCell.resourceName,
            for: indexPath
        )

        if let homeCell = cell as? HomeTableViewCell,
           let item = cellData.any(at: indexPath.row)
        {
            homeCell.accessoryType = .disclosureIndicator
            homeCell.setup(item: item)
        }

        return cell
    }
}
