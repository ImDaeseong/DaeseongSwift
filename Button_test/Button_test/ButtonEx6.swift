import UIKit

class ButtonEx6 : UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let imgNoraml = UIImage(named: "img3.png")
        let imgSelect = UIImage(named: "img4.png")
        self.backgroundColor = UIColor.clear
        self.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        self.setImage(imgNoraml, for: UIControl.State.normal)
        self.setImage(imgSelect, for: UIControl.State.selected)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
