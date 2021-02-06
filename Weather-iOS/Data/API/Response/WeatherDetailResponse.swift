struct WeatherDetailResponse: Decodable {
    var weather: [Weather]

    struct Weather: Decodable {
        var id: Int
        var main: String
        var description: String
        var icon: String
    }
}
