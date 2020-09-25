import UIKit
import Foundation

class UIStackViewEx1 : UIStackView {
    
    let view1: UIView = {
        let view1 = UIView()
        view1.backgroundColor = UIColor.red
        view1.layer.cornerRadius = 10
        view1.clipsToBounds = true
        return view1
    }()
    
    let view2: UIView = {
        let view2 = UIView()
        view2.backgroundColor = UIColor.green
        view2.layer.cornerRadius = 10
        view2.clipsToBounds = true
        return view2
    }()
    
    let view3: UIView = {
        let view3 = UIView()
        view3.backgroundColor = UIColor.blue
        view3.layer.cornerRadius = 10
        view3.clipsToBounds = true
        return view3
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initControl()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        initControl()
    }
    
    func initControl(){
        
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.alignment = .fill
        self.spacing = 5
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addArrangedSubview(view1)
        self.addArrangedSubview(view2)
        self.addArrangedSubview(view3)
    }
}
