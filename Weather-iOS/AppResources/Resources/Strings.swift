struct StringResources {

    private typealias Internal = R.string

    struct Weather {
        static var highestTemperature: String { Internal.localizable.highestTemperature() }
        static var lowestTemperature: String { Internal.localizable.lowestTemperature() }
        static var degree: String { Internal.localizable.degree() }
        static var unknown: String { Internal.localizable.unknown() }
    }

    struct API {
        static let apiBaseUrl = "https://api.openweathermap.org/data/2.5/weather"
        static let apiKey = "1e7057da493a73e034341a936d008870"
    }
}
