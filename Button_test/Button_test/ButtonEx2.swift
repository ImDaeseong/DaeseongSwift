
import UIKit

class ButtonEx2 : UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.shadowColor = UIColor(red: 115.0/255.0, green: 115.0/255.0, blue: 115.0/255.0, alpha: 1.0).cgColor
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 1.5
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.5)
    }
}
