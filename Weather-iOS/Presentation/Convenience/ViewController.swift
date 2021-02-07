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

        func areaFilter() -> AreaFilterViewController {
            let viewModel = AreaFilterViewModel()
            let vc = AreaFilterViewController.createInstance(viewModel: viewModel)
            return vc
        }

        func detail(cityName: String) -> DetailViewController {
            let viewModel = DetailViewModel(cityName: cityName)
            let vc = DetailViewController.createInstance(viewModel: viewModel)
            return vc
        }
    }
}
