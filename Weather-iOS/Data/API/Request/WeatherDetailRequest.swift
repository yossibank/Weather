struct WeatherDetailRequest: BaseRequest {

    typealias Response = WeatherDetailResponse

    struct Request: Encodable {
        var cityName: String
        var appKey: String
    }
    
    var path: String { "/" }
    
    var method: HttpMethod { .get }
}
