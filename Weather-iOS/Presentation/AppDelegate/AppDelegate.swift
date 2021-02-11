import Foundation
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private let router: RouterProtocol = Router()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = router.initialWindow(.home, type: .navigation)
        window?.makeKeyAndVisible()

        UserDefaults.areaIds = Area.allCases.compactMap { $0.id }

        return true
    }
}

