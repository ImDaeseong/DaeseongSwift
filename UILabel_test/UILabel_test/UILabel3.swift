import UIKit

class UILabel3 : UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit(){
        self.font = UIFont.systemFont(ofSize: 15, weight: .light)
        self.backgroundColor = .white
        self.textColor = .orange
        self.textAlignment = .center
        self.sizeToFit()
        
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
}
