import UIKit

final class AreaFilterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let viewSize = CGSize(width: 160, height: 44 * 8)

    private let viewData = Area.allCases.map { $0 }

    private var viewModel: AreaFilterViewModel!

    static func createInstance(viewModel: AreaFilterViewModel) -> AreaFilterViewController {
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44
    }
}

extension AreaFilterViewController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)

        viewModel.updateAreaIds(areaId: indexPath.row)

        let cell = tableView.cellForRow(at: indexPath)
        if let areaFilterCell = cell as? AreaFilterTableViewCell {
            let image = UserDefaults.areaIds.contains(indexPath.row) ?
                Resources.Images.General.checkIn :
                Resources.Images.General.checkOff

            areaFilterCell.checkButton.setImage(image, for: .normal)
            areaFilterCell.checkButton.isSelected = !areaFilterCell.checkButton.isSelected
        }
    }
}

extension AreaFilterViewController: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewData.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: AreaFilterTableViewCell.resourceName,
            for: indexPath
        )

        if let areaFilterCell = cell as? AreaFilterTableViewCell {
            if let item = viewData.any(at: indexPath.row) {
                let image = UserDefaults.areaIds.contains(indexPath.row) ?
                    Resources.Images.General.checkIn :
                    Resources.Images.General.checkOff

                areaFilterCell.checkButton.setImage(image, for: .normal)
                areaFilterCell.setup(item: item)
            }
        }

        return cell
    }
}
