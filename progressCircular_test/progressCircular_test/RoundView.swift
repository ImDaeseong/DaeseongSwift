
import UIKit

class RoundView : UIView {
   
    var percent : Int = 0 {
        didSet {
            self.txtlabel.text = "\(percent) %"
        }
    }
    
    let txtlabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.orange
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initcontrol()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initcontrol()
    }
    
    func initcontrol(){
        
        self.backgroundColor = UIColor.clear
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 5
        self.layer.cornerRadius = self.frame.height / 2
        
        self.addSubview(txtlabel)
        
        txtlabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        txtlabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

