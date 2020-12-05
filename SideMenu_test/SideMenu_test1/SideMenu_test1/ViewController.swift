import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img1view: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(imgview1Tapped))
        img1view.addGestureRecognizer(tapGesture1)
        img1view.isUserInteractionEnabled = true
    }
    
    @objc func imgview1Tapped() {
           
        let isFisrt = UserDefaultsManager.SharedInstance.getBool(sKey: "first")
        if isFisrt == false {
            
            if let VC = storyboard?.instantiateViewController(withIdentifier: "IntroViewController") {
                
                UIApplication.shared.keyWindow?.rootViewController = VC
            }
            
        } else {
            
            if let VC = storyboard?.instantiateViewController(withIdentifier: "SideMenuController") {
                
                UIApplication.shared.keyWindow?.rootViewController = VC
            }
        }
        
    }
    
}

