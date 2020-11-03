import Foundation
import CryptoKit

public func getVersion() -> String? {
    
    let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    //let version = Bundle.main.infoDictionary?["CFBundleVersion"] as! String
    //let version = Bundle.main.infoDictionary?["CFBundleIdentifier"] as! String
    return version
}

public func getGate() -> String {
    
    let dataFormat = DateFormatter()
    dataFormat.dateFormat = "yyyyMMddHHmmss"
    return dataFormat.string(from: Date())
}

public func getRandom() -> String? {
    
    let random = Int.random(in: 0..<10)
    
    let sRandom = String(format:"%d", random)
    
    return sRandom
}

public func getMD5(sInput : String) -> String? {
    
    let val = Insecure.MD5.hash(data: sInput.data(using: .utf8) ?? Data())
    return val.map{
        String(format: "%02hhx", $0)
    }.joined()
}

public func getSHA256(sInput : String) -> String? {
    
    let val = SHA256.hash(data: sInput.data(using: .utf8)!)
    return val.map{
        String(format: "%02hhx", $0)
    }.joined()
}
