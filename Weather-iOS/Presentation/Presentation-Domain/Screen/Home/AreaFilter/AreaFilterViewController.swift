import UIKit

class AreaFilterViewController: UIViewController {
    
    private let viewData = Region.allCases.map { $0 }

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(AreaFilterTableViewCell.xib(), forCellReuseIdentifier: AreaFilterTableViewCell.resourceName)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 40
    }
}

extension AreaFilterViewController: UITableViewDelegate {
    
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
            cell.accessoryType = .disclosureIndicator

            if let item = viewData.any(at: indexPath.row) {
                cell.setup(item: item)
            }
        }

        return cell
    }
}
