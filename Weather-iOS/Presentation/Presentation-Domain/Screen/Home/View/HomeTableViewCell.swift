import UIKit

protocol HomeCellDelegate: AnyObject {
    func didSelectFavoriteButton(
        at index: Int,
        in tableView: UITableView?
    )
}

final class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteButton: UIButton! {
        didSet {
            favoriteButton.addTarget(
                self,
                action: #selector(favoriteButtonTapped(_:)),
                for: .touchUpInside
            )
        }
    }
    @IBOutlet weak var prefectureNameLabel: UILabel!

    weak var delegate: HomeCellDelegate?
    weak var tableView: UITableView?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setup(item: Prefecture) {
        prefectureNameLabel.text = item.name
    }

    @objc private func favoriteButtonTapped(_ sender: UIButton) {
        delegate?.didSelectFavoriteButton(
            at: sender.tag,
            in: tableView
        )
    }
}
