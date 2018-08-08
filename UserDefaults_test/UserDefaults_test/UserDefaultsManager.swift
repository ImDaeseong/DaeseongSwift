
import Foundation

class UserDefaultsManager {

    static func getString(sKey : String) -> String {
        var sReturn = String()
        if let sValue = UserDefaults.standard.value(forKey: sKey) as? String {
            sReturn = sValue
        } else {
            sReturn = ""
        }
        return sReturn
    }

    static func setString(sKey : String, sValue : String) -> Void {
        UserDefaults.standard.setValue(sValue, forKey: sKey)
    }
    
    static func getInt(sKey : String) -> Int {
        var nReturn = Int()
        if let nValue = UserDefaults.standard.value(forKey: sKey) as? Int {
            nReturn = nValue
        } else {
            nReturn = 0
        }
        return nReturn
    }
    
    static func setInt(sKey : String, nValue : Int) -> Void {
        UserDefaults.standard.setValue(nValue, forKey: sKey)
    }
    
    static func getBool(sKey : String) -> Bool {
        var bReturn = Bool()
        if let bValue = UserDefaults.standard.value(forKey: sKey) as? Bool {
            bReturn = bValue
        } else {
            bReturn = false
        }
        return bReturn
    }
    
    static func setBool(sKey : String, bValue : Bool) -> Void {
        UserDefaults.standard.setValue(bValue, forKey: sKey)
    }
    
}
