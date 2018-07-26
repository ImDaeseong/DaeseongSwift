
import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var isRound:Bool = false {
        didSet {
            if isRound {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if isRound {
            layer.cornerRadius = frame.height / 2
        }
    }

}
