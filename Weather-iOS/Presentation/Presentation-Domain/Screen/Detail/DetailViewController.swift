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
        viewModel.fetchWeatherData { result in
            switch result {
            
            case .success(let weatherData):
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy/MM/dd/HH"
                dateFormatter.timeZone = NSTimeZone(name: "GMT") as TimeZone?
                let date = Date(timeIntervalSince1970: weatherData.date)
                self.dateLabel.text = String(dateFormatter.string(from: date))
                self.weatherLabel.text = weatherData.weatherName
                self.highestTemperatureLabel.text = String(weatherData.highestTemperature - 273.15)
                self.lowestTemperatureLabel.text = String(weatherData.lowestTemperature - 273.15)
                
            case .failure(let error):
                dump(error.description())
            }
        }
    }
}
