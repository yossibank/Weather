import UIKit

typealias VoidBlock = () -> Void

extension UIView {

    @IBInspectable var layerColor: UIColor? {
        get { return layer.backgroundColor.map { UIColor(cgColor: $0)} }
        set { layer.backgroundColor = newValue?.cgColor }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }

    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }

    @IBInspectable var borderColor: UIColor? {
        get { return layer.borderColor.map { UIColor(cgColor: $0)} }
        set { layer.borderColor = newValue?.cgColor }
    }

    @IBInspectable var shodowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }

    @IBInspectable var shodowOpacity: Float {
        get { return layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }

    @IBInspectable var shodowColor: UIColor? {
        get { return layer.shadowColor.map { UIColor(cgColor: $0)} }
        set { layer.shadowColor = newValue?.cgColor }
    }
}
