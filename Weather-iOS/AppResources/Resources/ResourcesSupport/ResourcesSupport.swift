import UIKit

protocol Initializable: AnyObject {
    static var className: String { get }
    static var resourceName: String { get }
}

protocol ClassInitializable: Initializable {
    init()
}

extension NSObject: ClassInitializable {

    static var className: String {
        String(describing: self)
    }

    static var resourceName: String {
        self.className
    }
}

extension Initializable where Self: UIViewController {

    static func instantiateInitialViewController(
        fromStoryboardOrNil customStoryboard: String? = nil
    ) -> Self {
        let finalStoryboardName = customStoryboard ?? self.resourceName
        let storyboard = UIStoryboard(
            name: finalStoryboardName,
            bundle: Bundle(for: self)
        )
        let controller = storyboard.instantiateInitialViewController()

        return controller as! Self
    }
}

extension Initializable where Self: UIView {

    static func xib(
        fromXibOrNil customXib: String? = nil
    ) -> UINib {
        let finalXibsName = customXib ?? self.resourceName

        return UINib(
            nibName: finalXibsName,
            bundle: Bundle(for: self)
        )
    }
}
