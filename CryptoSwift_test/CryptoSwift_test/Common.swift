import Foundation
import CryptoKit
import CommonCrypto

public func getDeviceInfo() -> String {
    
    var systemInfo = utsname()
    uname(&systemInfo)
    let machineMirror = Mirror(reflecting: systemInfo.machine)
    let identifier = machineMirror.children.reduce("") { identifier, element in
        guard let value = element.value as? Int8, value != 0 else { return identifier }
        return identifier + String(UnicodeScalar(UInt8(value)))
    }
    
    return identifier
}

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
    
    if #available(iOS 13.0, *) {
    
        let val = Insecure.MD5.hash(data: sInput.data(using: .utf8) ?? Data())
        return val.map{
            String(format: "%02hhx", $0)
        }.joined()
        
    } else {
        
        let cString = sInput.cString(using: .utf8)
        
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_MD5_DIGEST_LENGTH))
        
        CC_MD5(cString!, CUnsignedInt(sInput.lengthOfBytes(using: .utf8)), result)
        
        let hash = NSMutableString()
        
        for i in 0 ..< Int(CC_MD5_DIGEST_LENGTH) {
            hash.appendFormat("%02x", result[i])
        }
        
        result.deallocate()
        return String(format: hash as String)
    }
}

public func getSHA256(sInput : String) -> String? {
    
    if #available(iOS 13.0, *) {
        let val = SHA256.hash(data: sInput.data(using: .utf8)!)
        return val.map{
            String(format: "%02hhx", $0)
        }.joined()
        
    } else {
        
        let cString = sInput.cString(using: .utf8)
                
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: Int(CC_SHA256_DIGEST_LENGTH))
                
        CC_SHA256(cString!, CUnsignedInt(sInput.lengthOfBytes(using: .utf8)), result)
                
        let hash = NSMutableString()
                
        for i in 0 ..< Int(CC_SHA256_DIGEST_LENGTH) {
            hash.appendFormat("%02x", result[i])
        }
            
        result.deallocate()
        return String(format: hash as String)
    }
}
