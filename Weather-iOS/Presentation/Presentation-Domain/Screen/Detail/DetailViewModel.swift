final class DetailViewModel {

    private let cityName: String

    init(cityName: String) {
        self.cityName = cityName
    }

    func fetchWeatherData(completion: @escaping (Result<DetailViewData, APIError>) -> Void) {
        WeatherDetailRequest().request(parameter: .init(q: cityName)) { result in

            switch result {

            case .success(let response):
                completion(.success(self.map(data: response)))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func map(data: WeatherDetailRequest.Response) -> DetailViewData {
        DetailViewData(
            date: data.dt,
            weatherImageUrlString: data.weather[0].icon,
            weatherName: data.weather[0].main,
            highestTemperature: data.main.tempMax,
            lowestTemperature: data.main.tempMin
        )
    }
}
