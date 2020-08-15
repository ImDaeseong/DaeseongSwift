
import UIKit

class ButtonEx4 : UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let img = UIImage(named: "img3.png")
        self.backgroundColor = UIColor.clear
        self.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        self.setImage(img, for: UIControl.State.normal)
    }
    
}
