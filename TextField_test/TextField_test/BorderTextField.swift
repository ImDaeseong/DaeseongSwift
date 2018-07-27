
import UIKit

@IBDesignable
class BorderTextField: UITextField {

    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var bgColor : UIColor? {
        didSet {
            backgroundColor = bgColor
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var placeHolerColor : UIColor? {
        didSet {
            let sValue = attributedPlaceholder?.string != nil ? attributedPlaceholder!.string : ""
            let att = NSAttributedString(string: sValue, attributes: [NSAttributedStringKey.foregroundColor : placeHolerColor as Any])
            attributedPlaceholder = att
        }
    }
   

}
