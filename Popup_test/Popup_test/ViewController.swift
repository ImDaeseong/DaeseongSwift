import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    
    let menu = PopupView()
    
    private var bShow : Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //사이즈 변경시 반영
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonroundCornersBorder(button: button1)
    }
    
    @IBAction func button1_Click(_ sender: Any) {
        
        if bShow {
         
            bShow = false
            self.menu.removeFromSuperview()
            
        } else {
         
            bShow = true
            menu.buttonAction = { (isValue) in
                
                print(isValue)
                self.bShow = false
            }
            
            DispatchQueue.main.async {
                self.view.addSubview(self.menu)
                self.menu.leadingAnchor.constraint(equalTo: self.button1.leadingAnchor).isActive = true
                self.menu.topAnchor.constraint(equalTo: self.button1.bottomAnchor, constant: 4).isActive = true
                
                self.menu.translatesAutoresizingMaskIntoConstraints = false
                self.menu.heightAnchor.constraint(equalToConstant: 71).isActive = true
                self.menu.widthAnchor.constraint(equalToConstant: 76).isActive = true
            }
        }
    }
   
    
    
    func buttonroundCornersBorder(button : UIButton) {
        
        button.roundCornersBorder(corners: .allCorners, radius: 4, borderWidth: 1, borderColor: #colorLiteral(red: 255, green: 0, blue: 0, alpha: 1))
    }
}


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


//라운드 처리
extension UIView {
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func roundCornersBorder(corners:UIRectCorner, radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        self.roundCorners(corners: corners, radius: radius)
        
        guard let maskLayer = self.layer.mask as? CAShapeLayer else { return }
        
        // Add border
        let borderLayer = CAShapeLayer()
        borderLayer.path = maskLayer.path // Reuse the Bezier path
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.lineWidth = borderWidth
        borderLayer.frame = self.bounds
        self.layer.addSublayer(borderLayer)
    }
}
