import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var areaFilterButton: UIButton!

    private let router: RouterProtocol = Router()

    private var viewModel: HomeViewModel!

    static func createInstance(
        viewModel: HomeViewModel = HomeViewModel()
    ) -> HomeViewController {
        let instance = HomeViewController.instantiateInitialViewController()
        instance.viewModel = viewModel
        return instance
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupButton()
        setupTableView()
    }

    private func setupDelegate() {
        viewModel.delegate = self
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
        tableView.dataSource = viewModel
        tableView.delegate = self
        tableView.rowHeight = 50
    }
}

extension HomeViewController {

    @objc private func areaFilterButtonTapped(_ button: UIButton) {
        let areaFilterVC = AreaFilterViewController.createInstance()
        areaFilterVC.delegate = self

        showPopover(
            viewController: areaFilterVC,
            sourceView: button,
            viewSize: areaFilterVC.viewSize,
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

        if let cityName = viewModel.cellData.any(at: indexPath.row)?.apiName {
            router.push(.detail(cityName: cityName), from: self)
        }
    }
}

extension HomeViewController: AreaFilterTappedDelegate {

    func didSelectAreaFilter(areaIds: [Int]) {
        viewModel.cellData = Prefecture.allCases.filter { areaIds.contains($0.id) }
        tableView.reloadData()
    }
}

extension HomeViewController: FavoriteButtonDelegate {

    func didSelectFavoriteButton(at index: Int) {
        guard let cellData = viewModel.cellData.any(at: index) else {
            return
        }

        viewModel.setupFavoritePrefecture(cellData.name)

        tableView.reloadRows(
            at: [IndexPath(row: index, section: 0)],
            with: .fade
        )
    }
}
