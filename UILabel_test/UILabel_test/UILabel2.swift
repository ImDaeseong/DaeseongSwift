
import UIKit

class UILabel2 : UILabel {
    
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
    }
}
