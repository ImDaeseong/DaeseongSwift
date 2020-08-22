import UIKit

class UIViewEx1 : UIView {
    
    //var label1 : UILabel!
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initData()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    private func initData(){
        
        self.clipsToBounds = true
        
       
        
    }
    
}
