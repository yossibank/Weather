import UIKit

final class HomeViewController: UIViewController {

    private let viewData = Prefecture.allCases.map { $0 }
    private let router: RouterProtocol = Router()

    @IBOutlet weak var tableView: UITableView!

    static func createInstance() -> HomeViewController {
        let instance = HomeViewController.instantiateInitialViewController()
        return instance
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.register(HomeTableViewCell.xib(), forCellReuseIdentifier: HomeTableViewCell.resourceName)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        print(viewData[indexPath.row].apiName)
        router.push(.detail, from: self)
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
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: HomeTableViewCell.resourceName,
                for: indexPath) as? HomeTableViewCell
        else {
            return UITableViewCell()
        }

        cell.accessoryType = .disclosureIndicator
        cell.setup(item: viewData[indexPath.row])

        return cell
    }
}
