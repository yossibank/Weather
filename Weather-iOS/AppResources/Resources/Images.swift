import UIKit

struct ImageResources {

    private typealias Internal = R.image

    struct General {
        static var noImage: UIImage { Internal.no_image() ?? UIImage() }
        static var favorite: UIImage? { Internal.favorite() }
        static var nonFavorite: UIImage? { Internal.favorite_non() }
        static var checkIn: UIImage? { Internal.check_in() }
        static var checkOff: UIImage? { Internal.check_off() }
    }
}
