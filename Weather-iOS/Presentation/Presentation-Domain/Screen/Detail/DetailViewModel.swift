final class DetailViewModel {

    private let cityName: String

    init(cityName: String) {
        self.cityName = cityName
    }
    
    func fetchWeatherData() {
        WeatherDetailRequest().request(parameter: .init(q: cityName)) { result in

            switch result {

            case .success(let response):
                dump(response)

            case .failure(let error):
                dump(error.description())
            }
        }
    }
}
