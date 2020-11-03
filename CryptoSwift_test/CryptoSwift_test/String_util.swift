import Foundation

public func getReplace(sInput : String, sFind : String, sReplace : String) -> String? {
    
    if sInput == "" {
        return nil
    }
    
    let sResult = sInput.replacingOccurrences(of: sFind, with: sReplace)
    return sResult
}

public func getSplit(sInput : String, sType : Character) -> [String]? {
    
    if sInput == "" {
        return nil
    }
    
    return sInput.split(separator : sType).map(String.init)
}

public func getUpper(sInput : String) -> String? {
    
    if sInput == "" {
        return nil
    }
    
    return sInput.uppercased()
}

public func getSubString(sInput : String, nStart : Int, nEnd : Int) -> String? {
    
    let s1 = sInput.index(sInput.startIndex, offsetBy: nStart)
    let s2 = sInput.index(s1, offsetBy: nEnd)
    
    return String(sInput[s1..<s2])
}
