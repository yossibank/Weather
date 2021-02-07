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
        setWeatherData()
    }
    
    private func setWeatherData() {
        viewModel.fetchWeatherData { result in

            switch result {

            case .success(let weatherData):
                self.weatherLabel.text = weatherData.weatherName
                
                ImageLoader.shared.loadImage(
                    with: .string(urlSring: "https://openweathermap.org/img/w/\(weatherData.weatherImageUrlString).png")
                ) { image, _ in
                    self.weatherImageView.image = image
                }

                self.highestTemperatureLabel.text = Resources.Strings.Weather.highestTemperature
                    + Double.convertCelsiusToString(weatherData.highestTemperature)
                    + Resources.Strings.Weather.degree

                self.lowestTemperatureLabel.text = Resources.Strings.Weather.lowestTemperature
                    + Double.convertCelsiusToString(weatherData.lowestTemperature)
                    + Resources.Strings.Weather.degree

                self.dateLabel.text = Date
                    .fromConvertToDate(time: weatherData.date)
                    .toConvertString(with: .yearToDayOfWeekJapanase)

            case .failure(let error):
                dump(error.description())
            }
        }
    }
}
