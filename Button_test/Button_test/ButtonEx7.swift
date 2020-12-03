import UIKit

class ButtonEx7 : UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initImages()
    }
   
    fileprivate func initImages(){
        
        let normalImage = UIImage(named: "img5")
        let highlightedImage = UIImage(named: "img2")
        
        self.setBackgroundImage(normalImage, for: UIControl.State.normal)
        self.setBackgroundImage(highlightedImage, for: UIControl.State.highlighted)
        
        sizeToFit()
    }
}
