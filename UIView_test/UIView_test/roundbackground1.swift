import UIKit

class roundbackground1 : UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = UIColor(red: 237.0/255, green: 237.0/255, blue: 237.0/255, alpha: 1.0)
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 0.0
        self.layer.cornerRadius = 4
    }
}
