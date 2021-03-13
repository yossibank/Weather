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
        fetchWeatherData()
    }

    private func fetchWeatherData() {
        viewModel.fetchWeatherData { [weak self] result in
            guard let self = self else { return }

            switch result {

            case .success(let weatherData):
                self.setWeatherData(weatherData: weatherData)

            case .failure(let error):
                dump(error.description())
            }
        }
    }

    private func setWeatherData(weatherData: DetailViewData) {
        self.weatherLabel.text = weatherData.weatherName.description

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
    }
}
