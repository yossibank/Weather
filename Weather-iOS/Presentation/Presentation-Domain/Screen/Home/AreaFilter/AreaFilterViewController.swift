import UIKit

final class AreaFilterViewController: UIViewController {

    let viewSize = CGSize(width: 160, height: 44 * 8)

    private let viewData = Area.allCases.map { $0 }

    @IBOutlet weak var tableView: UITableView!

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

        if let cell = cell as? AreaFilterTableViewCell {

            if let item = viewData.any(at: indexPath.row) {
                cell.setup(item: item)
            }
        }

        return cell
    }
}
