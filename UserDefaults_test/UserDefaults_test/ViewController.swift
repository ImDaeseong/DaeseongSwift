

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        setData()
        getData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    private func getData(){

        let Data1 = UserDefaultsManager.getString(sKey: "Data1")
        let Data2 = UserDefaultsManager.getInt(sKey: "Data2")
        let Data3 = UserDefaultsManager.getBool(sKey: "Data3")
        print("\(Data1)")
        print("\(Data2)")
        print("\(Data3)")
        
    }
    
    private func setData(){
        
        let Data1 = "userdata"
        let Data2 = 1
        let Data3 = false
        UserDefaultsManager.setString(sKey: "Data1", sValue: Data1)
        UserDefaultsManager.setInt(sKey: "Data2", nValue: Data2)
        UserDefaultsManager.setBool(sKey: "Data3", bValue: Data3)
        
    }

}

