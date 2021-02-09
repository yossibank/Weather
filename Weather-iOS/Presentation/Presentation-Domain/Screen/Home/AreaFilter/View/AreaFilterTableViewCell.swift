import UIKit

final class AreaFilterTableViewCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var areaNameLabel: UILabel!

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
}
