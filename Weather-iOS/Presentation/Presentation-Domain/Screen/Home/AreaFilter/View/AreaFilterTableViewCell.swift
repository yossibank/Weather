import UIKit

protocol AreaFilterCellDelegate: AnyObject {
    func didSelectCheckButton(at index: Int)
}

class AreaFilterTableViewCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton! {
        didSet {
            checkButton.addTarget(
                self,
                action: #selector(checkButtonTapped(_:)),
                for: .touchUpInside
            )

            checkButton.isSelected = true
        }
    }

    @IBOutlet weak var areaNameLabel: UILabel!

    weak var delegate: AreaFilterCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setup(item: Area) {
        areaNameLabel.text = item.name

        let image = checkButton.isSelected ?
            Resources.Images.General.checkIn :
            Resources.Images.General.checkOff

        checkButton.setImage(image, for: .normal)
    }

    @objc private func checkButtonTapped(_ sender: UIButton) {
        checkButton.isSelected = !checkButton.isSelected
        delegate?.didSelectCheckButton(at: sender.tag)
    }
}
