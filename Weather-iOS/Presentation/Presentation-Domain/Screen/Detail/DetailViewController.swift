import UIKit

final class DetailViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var highestTemperatureLabel: UILabel!
    @IBOutlet weak var lowestTemperatureLabel: UILabel!

    private var viewModel: DetailViewModel!

    static func createInstance(viewModel: DetailViewModel) -> DetailViewController {
        let instance = DetailViewController.instantiateInitialViewController()
        instance.viewModel = viewModel
        return instance
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
