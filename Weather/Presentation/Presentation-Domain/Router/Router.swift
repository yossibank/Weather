import UIKit

protocol RouterProtocol: AnyObject {

    func push(
        _ route:  Route,
        from:     UIViewController,
        animated: Bool
    )

    func push(
        _ viewController: UIViewController,
        from:             UIViewController,
        animated:         Bool
    )

    func present(
        _ route:               Route,
        from:                  UIViewController,
        presentationStyle:     UIModalPresentationStyle,
        animated:              Bool,
        completion:            VoidBlock?
    )

    func present(
        _ viewController:      UIViewController,
        from:                  UIViewController,
        presentationStyle:     UIModalPresentationStyle,
        animated:              Bool,
        completion:            VoidBlock?
    )

    func dismiss(
        _ viewController: UIViewController,
        animated:         Bool,
        completion:       VoidBlock?
    )

    func initialWindow(
        _ route: Route,
        type:    ControllerType
    ) -> UIViewController
}

extension RouterProtocol {

    func push(
        _ route:  Route,
        from:     UIViewController,
        animated: Bool = true
    ) {
        push(
            route,
            from:     from,
            animated: animated
        )
    }

    func push(
        _ viewController: UIViewController,
        from:             UIViewController,
        animated:         Bool = true
    ) {
        push(
            viewController,
            from:     from,
            animated: animated
        )
    }

    func present(
        _ route:               Route,
        from:                  UIViewController,
        presentationStyle:     UIModalPresentationStyle = .pageSheet,
        animated:              Bool = true,
        completion:            VoidBlock? = nil
    ) {
        present(
            route,
            from: from,
            presentationStyle: presentationStyle,
            animated: animated,
            completion: completion
        )
    }

    func present(
        _ viewController:      UIViewController,
        from:                  UIViewController,
        presentationStyle:     UIModalPresentationStyle = .pageSheet,
        animated:              Bool = true,
        completion:            VoidBlock? = nil
    ) {
        present(
            viewController,
            from:              from,
            presentationStyle: presentationStyle,
            animated:          animated,
            completion:        completion
        )
    }

    func dismiss(
        _ viewController: UIViewController,
        animated:         Bool = true,
        completion:       VoidBlock? = nil
    ) {
        dismiss(
            viewController,
            animated: animated,
            completion: completion
        )
    }
}

enum Route {

    case home
    case areaFilter
    case detail(cityName: String)

    fileprivate func viewController() -> UIViewController {

        let viewController: UIViewController

        switch self {

        case .home:
            viewController = Resources.ViewControllers.App.home()
            
        case .areaFilter:
            viewController = Resources.ViewControllers.App.areaFilter()

        case .detail(let cityName):
            viewController = Resources.ViewControllers.App.detail(cityName: cityName)
        }

        return viewController
    }
}

enum ControllerType {
    case normal
    case navigation
}

final class Router: RouterProtocol {

    func push(
        _ route: Route,
        from: UIViewController,
        animated: Bool
    ) {
        let destinationViewController = route.viewController()

        internalPush(
            destinationViewController,
            from:     from,
            animated: animated
        )
    }

    func push(
        _ viewController: UIViewController,
        from:             UIViewController,
        animated:         Bool
    ) {
        internalPush(
            viewController,
            from:     from,
            animated: animated
        )
    }

    private func internalPush(
        _ resolvedController: UIViewController,
        from:                 UIViewController,
        animated:             Bool
    ) {
        let vc = resolvedController
        let navVC = from.navigationController

        navVC?.pushViewController(
            vc,
            animated: animated
        )
    }

    func present(
        _ route:           Route,
        from:              UIViewController,
        presentationStyle: UIModalPresentationStyle,
        animated:          Bool,
        completion:        VoidBlock?
    ) {
        let vc = route.viewController()

        internalPresesent(
            vc,
            from: from,
            presentationStyle: presentationStyle,
            animated: animated,
            completion: completion
        )
    }

    func present(
        _ viewController:  UIViewController,
        from:              UIViewController,
        presentationStyle: UIModalPresentationStyle,
        animated:          Bool,
        completion:        VoidBlock?
    ) {
        internalPresesent(
            viewController,
            from:              from,
            presentationStyle: presentationStyle,
            animated:          animated,
            completion:        completion
        )
    }

    private func internalPresesent(
        _ resolvedController:  UIViewController,
        from:                  UIViewController,
        presentationStyle:     UIModalPresentationStyle,
        animated:              Bool,
        completion:            VoidBlock?
    ) {
        let vc = resolvedController

        vc.modalPresentationStyle = presentationStyle

        from.present(
            vc, animated:
                animated,
            completion: completion
        )
    }

    func dismiss(
        _ viewController: UIViewController,
        animated: Bool,
        completion: VoidBlock?
    ) {
        if let nc = viewController.navigationController, nc.viewControllers.count >= 1 {
            nc.popViewController(animated: animated)
        } else {
            viewController.dismiss(
                animated: animated,
                completion: completion
            )
        }
    }

    func initialWindow(
        _ route: Route,
        type: ControllerType
    ) -> UIViewController {
        var viewController: UIViewController

        switch type {

        case .normal:
            viewController = route.viewController()

        case .navigation:
            viewController = UINavigationController(rootViewController: route.viewController())

        }

        return viewController
    }
}
