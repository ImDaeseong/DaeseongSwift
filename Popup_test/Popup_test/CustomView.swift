import UIKit

class CustomView: UIView {
    
    required init?(coder cd: NSCoder) {
        super.init(coder: cd)
        loadNib()
    }
    
    override init(frame fr: CGRect) {
        super.init(frame: fr)
        loadNib()
    }
    
    func loadNib() {
        
        let view = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        addSubview(view)
        
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }

    
    @IBAction func button1_Click(_ sender: Any) {
        
        print("button1_Click")
        
        removeFromSuperview()
    }
    
    
    @IBAction func button2_Click(_ sender: Any) {
        
        print("button2_Click")
        
        removeFromSuperview() 
    }
}
