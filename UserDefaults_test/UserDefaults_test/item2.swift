import UIKit

class item2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeUserDefaults()
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        
        UserDefaultsManager.SharedInstance.setString(sValue: "이름", sKey: "name")
        UserDefaultsManager.SharedInstance.setInt(nValue: 2342, sKey: "age")
        UserDefaultsManager.SharedInstance.setBool(bValue: true, sKey: "success")
    }
    
    @IBAction func btn2_click(_ sender: UIButton) {
        print(UserDefaultsManager.SharedInstance.getString(sKey: "name"))
        print(UserDefaultsManager.SharedInstance.getInt(sKey: "age"))
        print(UserDefaultsManager.SharedInstance.getBool(sKey: "success"))
    }
    
    func removeUserDefaults(){
        UserDefaultsManager.SharedInstance.delString(sKey: "name")
        UserDefaultsManager.SharedInstance.delInt(sKey: "age")
        UserDefaultsManager.SharedInstance.delBool(sKey: "success")
    }
}
