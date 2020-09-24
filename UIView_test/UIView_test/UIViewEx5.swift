import UIKit

class UIViewEx5 : UIView {
    
    let textfield : UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.textColor = .black
        textfield.leftViewMode = .always
        textfield.borderStyle = .none
        return textfield
    }()
    
    let underline : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .orange
        return view
    }()
    
    let underlabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initcontrol()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initcontrol()
    }
    
    func initcontrol(){
        
        self.addSubview(textfield)
        self.addSubview(underline)
        self.addSubview(underlabel)
        
        textfield.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        textfield.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true
        textfield.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        underline.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        underline.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        underline.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        underline.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 10).isActive = true
        
        underlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        underlabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        underlabel.topAnchor.constraint(equalTo: underline.bottomAnchor, constant: 10).isActive = true
        underlabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
