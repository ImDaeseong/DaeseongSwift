
import UIKit

class ButtonEx1 : UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = self.frame.height / 2
        self.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        self.tintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        self.setTitleColor(UIColor.red, for: UIControl.State.normal)
    }
    
    func touchIn(){
        self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseIn], animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        touchIn()
    }
}
