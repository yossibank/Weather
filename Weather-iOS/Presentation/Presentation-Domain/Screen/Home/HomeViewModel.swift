import UIKit

protocol FavoriteButtonDelegate: AnyObject {
    func didSelectFavoriteButton(at index: Int)
}

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

    weak var delegate: FavoriteButtonDelegate?

    func setupFavoritePrefecture(_ prefectureName: String) {
        if favoritePrefecture.contains(prefectureName) {
            favoritePrefecture.remove(value: prefectureName)
        } else {
            favoritePrefecture.append(prefectureName)
        }
    }

    func filteringFavoritePrefecture(isSelected: Bool) {
        if isSelected {
            cellData = Prefecture.allCases.filter {
                favoritePrefecture.contains($0.name)
            }
        } else {
            cellData = Prefecture.allCases.map { $0 }
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

    func didSelectFavoriteButton(at index: Int) {
        delegate?.didSelectFavoriteButton(at: index)
    }
}
