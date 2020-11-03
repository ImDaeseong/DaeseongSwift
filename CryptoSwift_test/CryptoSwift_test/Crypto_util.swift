import Foundation
import CryptoSwift

func aesEncryptMessage(aeskey: String, sData:String) -> String? {
    
    if let aes = try? AES(key: aeskey.bytes, blockMode: .ECB, padding: .pkcs5),
       let encrypt = try? aes.encrypt(Array<UInt8>(sData.utf8)) {
        
        return encrypt.toHexString()
        /*
        return encrypt.map {
            String(format: "%02hhx", $0)
        }.joined()
        */
    }
    return nil
}

func aesDecryptMessage(aeskey: String, sData:String) -> String? {
   
    if let aes = try? AES(key: aeskey.bytes, blockMode: .ECB, padding: .pkcs5),
       let decrypt = try? aes.decrypt(Array<UInt8>(hex: sData)) {
        
        let data = Data(decrypt)
        return String(bytes: data.bytes, encoding: .utf8) ?? nil
    }
    return nil
}
