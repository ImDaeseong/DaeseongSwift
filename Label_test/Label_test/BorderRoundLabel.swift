
import UIKit

@IBDesignable
class BorderRoundLabel: UILabel {

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
    
    override func awakeFromNib() {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.textColor = txtColor
        self.backgroundColor = bgColor    //UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 0.9)
    }

}
