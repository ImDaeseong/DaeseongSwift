
import UIKit

@IBDesignable
class BorderStepper: UIStepper {

   
    @IBInspectable var borderColor : UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.masksToBounds = true
            
        }
    }

    @IBInspectable var borderRadius : CGFloat = 0 {
        didSet {
            layer.cornerRadius = borderRadius
            layer.masksToBounds = true
        }
    }
    
    override func prepareForInterfaceBuilder() {
        self.backgroundColor = UIColor.clear
    }

}
