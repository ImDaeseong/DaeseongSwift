
import Foundation

class UserDefaultsManager {
    
    public static let SharedInstance = UserDefaultsManager()
    
    private var userDefault : UserDefaults
    
    private init(){
        userDefault = UserDefaults(suiteName: "Daeseong")!
    }
    
    func setString(sValue : String , sKey : String){
        userDefault.setValue(sValue, forKey: sKey)
        userDefault.synchronize()
    }
    
    func getString(sKey : String) -> String {
        
        var value : String = ""
        if userDefault.object(forKey: sKey) != nil {
            value = userDefault.object(forKey: sKey) as! String
        }
        return value
    }
    
    func delString(sKey : String){
        userDefault.removeObject(forKey: sKey)
        userDefault.synchronize()
    }
    
    func setInt(nValue : Int, sKey : String){
        userDefault.setValue(nValue, forKey: sKey)
        userDefault.synchronize()
    }
    
    func getInt(sKey : String) -> Int {
        
        var value : Int = 0
        if userDefault.object(forKey: sKey) != nil {
            value = userDefault.object(forKey: sKey) as! Int
        }
        return value
    }
    
    func delInt(sKey : String){
        userDefault.removeObject(forKey: sKey)
        userDefault.synchronize()
    }
    
    func setBool(bValue : Bool, sKey : String){
        userDefault.setValue(bValue, forKey: sKey)
        userDefault.synchronize()
    }
    
    func getBool(sKey : String) -> Bool {
        
        var value : Bool = false
        if userDefault.object(forKey: sKey) != nil {
            value = userDefault.object(forKey: sKey) as! Bool
        }
        return value
    }
    
    func delBool(sKey : String){
        userDefault.removeObject(forKey: sKey)
        userDefault.synchronize()
    }
}
