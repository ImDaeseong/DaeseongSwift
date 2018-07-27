
import UIKit

@IBDesignable
class RoundImageView: UIImageView {

    override func layoutSubviews() {
        self.layer.cornerRadius = self.frame.width / 2
        //self.layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }    

    public func setborderColor(borderColor : UIColor, borderWidth : CGFloat) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        //self.layer.cornerRadius = self.layer.frame.size.width / 2
        self.clipsToBounds = true
    }
    
    
}
