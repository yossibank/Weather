import UIKit

extension UIViewController {

    func showPopover(
        viewController: UIViewController,
        sourceView:     UIView,
        viewSize:       CGSize,
        direction:      UIPopoverArrowDirection,
        delegate:       UIPopoverPresentationControllerDelegate?
    ) {
        viewController.modalPresentationStyle = .popover
        viewController.preferredContentSize = viewSize

        let presentationController = viewController.popoverPresentationController
        presentationController?.sourceView = sourceView
        presentationController?.sourceRect = sourceView.bounds
        presentationController?.permittedArrowDirections = direction
        presentationController?.delegate = delegate

        present(viewController, animated: true)
    }
}
