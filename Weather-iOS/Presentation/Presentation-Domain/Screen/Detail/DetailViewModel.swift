final class DetailViewModel {

    private let cityName: String

    init(cityName: String) {
        self.cityName = cityName
    }

    func fetchWeatherData(
        completion: @escaping (Result<DetailViewData, APIError>) -> Void
    ) {
        WeatherDetailRequest().request(parameter: .init(q: cityName)) { [weak self] result in
            guard let self = self else { return }

            switch result {

            case .success(let response):
                completion(.success(self.map(data: response)))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func map(data: WeatherDetailRequest.Response) -> DetailViewData {
        let weatherName = WeatherDescription.allCases.filter {
            $0.rawValue == data.weather.first?.main
        }

        return DetailViewData(
            date: data.dt,
            weatherImageUrlString: data.weather[0].icon,
            weatherName: weatherName.first ?? .unknown ,
            highestTemperature: data.main.tempMax,
            lowestTemperature: data.main.tempMin
        )
    }
}
