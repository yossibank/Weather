import UIKit

extension Resources {

    static var ViewControllers: ViewController {
        ViewController()
    }

    struct ViewController {

        var App: AppControllers {
            AppControllers()
        }
    }

    struct AppControllers {

        func home() -> HomeViewController {
            let vc = HomeViewController.createInstance()
            return vc
        }

        func detail() -> DetailViewController {
            let vc = DetailViewController.createInstance()
            return vc
        }
    }
}
