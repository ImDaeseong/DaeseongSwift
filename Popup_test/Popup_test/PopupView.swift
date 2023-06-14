import UIKit

//팝업 뷰
class PopupView : UIView {
    
    var buttonAction: ((Int) -> ())? = nil
    var upAction: (() -> ())? = nil
    var downAction: (() -> ())? = nil
    
    private var button1 : UIButton = {
        
        let btn1 = UIButton()
        btn1.titleLabel?.textAlignment = .center
        btn1.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn1.setTitleColor(.white, for: UIControl.State.normal)
        btn1.setTitle("button1", for: UIControl.State.normal)
        btn1.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1) //UIColor.black
        return btn1
    }()
    
    private var line : UIView = {
        
        let v1 = UIView()
        v1.backgroundColor = UIColor(red: 0, green: 255, blue: 0, alpha: 1)
        return v1
    }()
    
    private var button2 : UIButton = {
        
        let btn2 = UIButton()
        btn2.titleLabel?.textAlignment = .center
        btn2.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn2.setTitleColor(.white, for: UIControl.State.normal)
        btn2.setTitle("button2", for: UIControl.State.normal)
        btn2.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1) //UIColor.black
        return btn2
    }()
    
    required init?(coder cd: NSCoder) {
        super.init(coder: cd)
        initcontrol()
    }
    
    override init(frame fr: CGRect) {
        super.init(frame: fr)
        initcontrol()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.roundCornersBorder(corners: .allCorners, radius: 4, borderWidth: 1, borderColor: #colorLiteral(red: 255, green: 0, blue: 0, alpha: 1))
    }
    
    func initcontrol() {
        
        self.addSubview(button1)
        self.addSubview(line)
        self.addSubview(button2)
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        button1.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        button1.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        line.translatesAutoresizingMaskIntoConstraints = false
        line.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        line.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        line.topAnchor.constraint(equalTo: button1.bottomAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        button2.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        button2.topAnchor.constraint(equalTo: line.bottomAnchor).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        button1.addTarget(self, action: #selector(button1_click), for: UIControl.Event.touchUpInside)
        button2.addTarget(self, action: #selector(button2_click), for: UIControl.Event.touchUpInside)
     }
    
    @objc private func button1_click() {
        
        if self.upAction != nil {
            
            self.upAction!()
            
        } else if buttonAction != nil {
            
            self.buttonAction!(1)
        }
        
        self.removeFromSuperview()
    }
    
    @objc private func button2_click() {
        
        if self.downAction != nil {
            
            self.downAction!()
            
        } else if buttonAction != nil {
            
            self.buttonAction!(2)
        }
        
        self.removeFromSuperview()
    }
}
