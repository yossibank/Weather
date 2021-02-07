import UIKit

final class HomeViewController: UIViewController {

    private let viewData = Prefecture.allCases.map { $0 }
    private let router: RouterProtocol = Router()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var areaFilterButton: UIButton!

    static func createInstance() -> HomeViewController {
        let instance = HomeViewController.instantiateInitialViewController()
        return instance
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        setupTableView()
    }

    private func setupButton() {
        areaFilterButton.addTarget(
            self,
            action: #selector(areaFilterButtonTapped(_:)),
            for: .touchUpInside
        )
    }

    private func setupTableView() {
        tableView.register(HomeTableViewCell.xib(), forCellReuseIdentifier: HomeTableViewCell.resourceName)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
    }
}

extension HomeViewController {

    @objc private func areaFilterButtonTapped(_ button: UIButton) {
        let viewController = AreaFilterViewController.createInstance(viewModel: AreaFilterViewModel())

        showPopover(
            viewController: viewController,
            sourceView: button,
            viewSize: viewController.viewSize,
            direction: .up,
            delegate: self
        )
    }
}

extension HomeViewController: UIPopoverPresentationControllerDelegate {

    func adaptivePresentationStyle(
        for controller: UIPresentationController,
        traitCollection: UITraitCollection
    ) -> UIModalPresentationStyle {
        .none
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let cityName = viewData.any(at: indexPath.row)?.apiName {
            router.push(.detail(cityName: cityName), from: self)
        }
    }
}

extension HomeViewController: UITableViewDataSource {

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
                withIdentifier: HomeTableViewCell.resourceName,
                for: indexPath
        )

        if let cell = cell as? HomeTableViewCell {
            cell.accessoryType = .disclosureIndicator

            if let item = viewData.any(at: indexPath.row) {
                cell.setup(item: item)
            }
        }

        return cell
    }
}
