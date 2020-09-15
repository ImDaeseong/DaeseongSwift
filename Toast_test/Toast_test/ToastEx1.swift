import UIKit

final class ToastEx1 {
    
    var label : UILabel = UILabel()
    
    init(w:CGFloat, h:CGFloat){
        
        self.label = UILabel(frame: CGRect(x: 10, y: h - 100, width: w - (20), height: 30))
    }
    
    func show(sMessage : String?) -> UILabel{
        
        self.label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        self.label.backgroundColor = UIColor.orange
        self.label.textColor = .black
        self.label.textAlignment = .center
        
        self.label.layer.borderWidth = 0.2
        self.label.layer.cornerRadius = 10
        self.label.layer.borderColor = UIColor.orange.cgColor
        self.label.clipsToBounds = true
        
        self.label.text = sMessage
        self.label.alpha = 1
        return self.label
    }
}
