import UIKit

class viewxib1 : UIView {
    
    private let xibName = "viewxib1"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadinit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadinit()
    }
    
    private func loadinit(){
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        
        self.addSubview(view)
    }
}
