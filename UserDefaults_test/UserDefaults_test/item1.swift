import UIKit

class item1: UIViewController {
    
    
    @IBOutlet weak var textfield1: UITextField!
    
    @IBOutlet weak var textfield2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removeUserDefaults()
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        
        let value1 = textfield1.text
        let value2 = textfield2.text
        
        let userDefault = UserDefaults.standard
        userDefault.set(value1, forKey: "name")
        userDefault.set(value2, forKey: "age")
        userDefault.set(true, forKey: "success")
        userDefault.synchronize()
    }
    
    @IBAction func btn2_click(_ sender: UIButton) {
        
        if UserDefaults.standard.string(forKey: "name") != nil {
            print(UserDefaults.standard.string(forKey: "name")!)
        }
        print(UserDefaults.standard.integer(forKey: "age"))
        print(UserDefaults.standard.bool(forKey: "success"))
    }
    
    func removeUserDefaults(){
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: "name")
        userDefault.removeObject(forKey: "age")
        userDefault.removeObject(forKey: "success")
        userDefault.synchronize()
    }
}
