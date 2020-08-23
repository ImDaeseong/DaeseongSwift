
import UIKit

class ButtonEx5 : UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = self.frame.height / 2
        
        self.addTarget(self, action: #selector(onBorderChange(_:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc func onBorderChange(_ sender : UIButton){
        
        if(self.layer.borderColor == UIColor.orange.cgColor){
            self.setTitleColor(UIColor.red, for: UIControl.State.normal)
            self.layer.borderColor = UIColor.red.cgColor
        }else{
            self.setTitleColor(UIColor.orange, for: UIControl.State.normal)
            self.layer.borderColor = UIColor.orange.cgColor
        }
    }
}
