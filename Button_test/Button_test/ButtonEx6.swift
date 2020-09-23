import UIKit

class ButtonEx6 : UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        
        if state == .normal {
            self.layer.borderColor = UIColor.orange.cgColor
            self.backgroundColor = UIColor.orange
            setTitleColor(UIColor.darkText, for: UIControl.State.normal)
        }else if state == .disabled {
            self.layer.borderColor = UIColor.gray.cgColor
            self.backgroundColor = UIColor.clear
            setTitleColor(UIColor.lightText, for: UIControl.State.disabled)
        }
    }
}
