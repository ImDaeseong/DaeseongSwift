import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var view2: UIView!
    
    var view3 : UIView!
    
    var VC : UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetUIViewController(item: "item1")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //print("viewDidAppear")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //print("가로 세로 모드 변경시")
        
        addview3()
    }
    
    @IBAction func btn1_click(_ sender: Any) {
        
        GetUIViewController(item: "item1")
    }
    
    @IBAction func btn2_click(_ sender: Any) {
        
        GetUIViewController(item: "item2")
    }
    
    @IBAction func btn3_click(_ sender: Any) {
        
        GetUIViewController(item: "item3")
    }
    
    private func GetUIViewController(item : String) {
        
        if VC != nil {
            VC.willMove(toParent: nil)
            VC.view.removeFromSuperview()
            VC.removeFromParent()
        }
        
        
        VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: item)
        
        self.addChild(VC)
        VC.view.frame = view2.bounds
        view2.addSubview(VC.view)
        VC.didMove(toParent: self)
    }
    
    private func addview3(){
        
        if view3 != nil {
            view3.removeFromSuperview()
        }
        
        let viewSize : CGFloat = 50
        let centerX = (self.view2.frame.width / 2) - (viewSize / 2)
        let centerY = (self.view2.frame.height / 2) - (viewSize / 2)
        let frame = CGRect(x: centerX, y: centerY, width: viewSize, height: viewSize)
        
        view3 = UIView(frame: frame)
        view3.backgroundColor = UIColor.red
        view3.layer.cornerRadius = 10
        view3.layer.borderWidth = 2
        view3.layer.borderColor = UIColor.white.cgColor
        self.view2.addSubview(view3)
    }
    
}

