
import UIKit

class ButtonEx3 : UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setTitle("테스트3", for: .normal)
        self.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 1.0
    }
    
}
