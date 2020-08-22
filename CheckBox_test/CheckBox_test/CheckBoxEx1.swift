import UIKit

class CheckBoxEx1 : UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initbutton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initbutton()
    }
    
    private func initbutton(){
        
        let uncheck = UIImage(named: "img2.png")
        let check = UIImage(named: "img3.png")
        setImage(uncheck, for: .normal)
        setImage(check, for: .selected)
        
        self.addTarget(self, action: #selector(onCheckTapped(_:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc func onCheckTapped(_ sender : UIButton){
        
        if(sender.isSelected){
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
    }
    
}
