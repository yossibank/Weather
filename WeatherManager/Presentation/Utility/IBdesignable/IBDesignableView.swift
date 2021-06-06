import UIKit

@IBDesignable
extension UIView {}

class IBDesignableView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    func commonInit() {
        #if TARGET_INTERFACE_BUIDLER
        self.setNeedsLayout()
        self.setNeedsDisplay()
        #endif
    }
}

class IBDesignableBorderBottomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    func commonInit() {
        let border = CALayer()
        border.frame = .init(x: 0, y: self.frame.height - 1.0, width: self.frame.width, height: 1.0)
        border.backgroundColor = UIColor.gray.cgColor
        self.layer.addSublayer(border)
    }
}
