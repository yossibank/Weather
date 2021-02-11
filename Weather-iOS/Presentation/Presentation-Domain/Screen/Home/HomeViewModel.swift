import UIKit

final class HomeViewModel: NSObject, UITableViewDataSource {

    var cellData = Prefecture.allCases.map { $0 }

    private var favoritePrefecture: [String] {
        get {
            UserDefaults.prefectureNames
        }
        set {
            UserDefaults.prefectureNames = newValue
        }
    }
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
            homeCell.delegate = self
            homeCell.tableView = tableView
            homeCell.favoriteButton.tag = indexPath.row
            homeCell.setup(item: item)

            let image = favoritePrefecture.contains(item.name) ?
                Resources.Images.General.favorite :
                Resources.Images.General.nonFavorite

            homeCell.favoriteButton.setImage(image, for: .normal)
        }

        return cell
    }
}

extension HomeViewModel: HomeCellDelegate {

    func didSelectFavoriteButton(
        at index: Int,
        in tableView: UITableView?
    ) {
        guard let cellData = cellData.any(at: index) else {
            return
        }

        if favoritePrefecture.contains(cellData.name) {
            favoritePrefecture.remove(value: cellData.name)
        } else {
            favoritePrefecture.append(cellData.name)
        }

        tableView?.reloadRows(
            at: [IndexPath(row: index, section: 0)],
            with: .fade
        )
    }
}
