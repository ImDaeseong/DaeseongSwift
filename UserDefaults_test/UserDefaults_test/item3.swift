import UIKit

class item3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        
        if UserDefaults.standard.string(forKey: "name") != nil {
            print(UserDefaults.standard.string(forKey: "name")!)
        }
        print(UserDefaults.standard.integer(forKey: "age"))
        print(UserDefaults.standard.bool(forKey: "success"))
    }
    
    @IBAction func btn2_click(_ sender: UIButton) {
        
        print(UserDefaultsManager.SharedInstance.getString(sKey: "name"))
        print(UserDefaultsManager.SharedInstance.getInt(sKey: "age"))
        print(UserDefaultsManager.SharedInstance.getBool(sKey: "success"))
    }
}
