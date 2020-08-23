import UIKit

class UISwitchEx1 : UISwitch {
    
    @IBInspectable var scale : CGFloat = 1 {
        didSet{
            initcommon()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initcommon()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initcommon()
    }
    
    private func initcommon(){
        
        //이미지 적용 않됨
        //self.offImage = UIImage(named: "img1")
        //self.onImage = UIImage(named: "img2")
        
        //크기 조정
        self.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
}
