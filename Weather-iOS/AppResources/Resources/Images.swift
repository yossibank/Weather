import UIKit

struct ImageResources {

    private typealias Internal = R.image

    struct General {
        static var noImage: UIImage { Internal.no_image() ?? UIImage() }
    }
}
