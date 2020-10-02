import UIKit

class ImageViewEx4 : UIImageView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit(){
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.masksToBounds = false
        self.clipsToBounds = true//뷰의 범위 밖으로 컨텐트 출력이 않됨
    }
}

