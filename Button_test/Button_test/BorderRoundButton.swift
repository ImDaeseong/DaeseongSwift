
import UIKit

@IBDesignable
class BorderRoundButton: UIButton {

    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var textColor : UIColor = UIColor.clear {
        didSet {
            setTitleColor(textColor, for: UIControlState.normal)
        }
    }
   
    
}
