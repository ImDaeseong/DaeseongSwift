
import UIKit

@IBDesignable
class UILabel1 : UILabel {
    
    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var bgColor : UIColor = UIColor.clear {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    @IBInspectable var txtColor: UIColor = UIColor.clear {
        didSet {
            self.textColor = txtColor
        }
    }
    
    @IBInspectable var rotationAngle: CGFloat = 0 {
        didSet {
            self.transform = CGAffineTransform(rotationAngle: rotationAngle * .pi / 180)
        }
    }
}
