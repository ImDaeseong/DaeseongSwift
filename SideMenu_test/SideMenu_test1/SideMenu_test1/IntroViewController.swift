
import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_click(_ sender: Any) {
        
        UserDefaultsManager.SharedInstance.setBool(bValue: true, sKey: "first")
        
        if let VC = storyboard?.instantiateViewController(withIdentifier: "SideMenuController") {
            
            UIApplication.shared.keyWindow?.rootViewController = VC
        }
    }
    
}
