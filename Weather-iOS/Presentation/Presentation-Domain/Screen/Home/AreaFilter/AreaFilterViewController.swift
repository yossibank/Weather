import UIKit

protocol AreaFilterTappedDelegate: AnyObject {
    func didSelectAreaFilter(areaIds: [Int])
}

final class AreaFilterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let viewSize = CGSize(width: 160, height: 40 * 8)

    weak var delegate: AreaFilterTappedDelegate?

    private var viewModel: AreaFilterViewModel!

    static func createInstance(
        viewModel: AreaFilterViewModel = AreaFilterViewModel()
    ) -> AreaFilterViewController {
        let instance = AreaFilterViewController.instantiateInitialViewController()
        instance.viewModel = viewModel
        return instance
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.register(AreaFilterTableViewCell.xib(), forCellReuseIdentifier: AreaFilterTableViewCell.resourceName)
        tableView.dataSource = viewModel
        tableView.delegate = self
        tableView.rowHeight = 40
    }
}

extension AreaFilterViewController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)

        viewModel.updateAreaIds(areaId: indexPath.row)

        if let cell = tableView.cellForRow(at: indexPath),
           let areaFilterCell = cell as? AreaFilterTableViewCell
        {
            let image = viewModel.areaIds.contains(indexPath.row) ?
                Resources.Images.General.checkIn :
                Resources.Images.General.checkOff

            areaFilterCell.checkImageView.image = image
        }

        delegate?.didSelectAreaFilter(areaIds: viewModel.areaIds)
    }
}
