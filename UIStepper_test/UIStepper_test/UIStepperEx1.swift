import UIKit

class UIStepperEx1: UIStepper {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initcommon()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initcommon()
    }
    
    private func initcommon(){
        
        self.backgroundColor = UIColor.clear
        self.tintColor = UIColor.orange
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}
