
import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //getBTC()
        //getlogin()
        //encdec()
    }
    
    private func encdec(){
        
        let sAppVersion = getVersion()!
        let Random = getRandom()!
        let key1 = getGate()
        let key2 = getMD5(sInput: key1)!
        let key3 = getUpper(sInput: key2)!
        let cryptkey = getSubString(sInput: key3, nStart: 4, nEnd: 16)!
        print("cryptkey:" + cryptkey + "\n")
        
        let id = "test"
        let pwd = "test1234"
        let SHA256 = getSHA256(sInput: pwd + "~!@#$%%^&*")!
        let sPwd = getUpper(sInput: SHA256)!
        
        let sTemp = Random + ";" + id + ";" + sPwd + ";" + sAppVersion
        print("sTemp:" + sTemp  + "\n")
        
        let enc = aesEncryptMessage(aeskey: cryptkey, sData:sTemp)!
        print("enc:" + enc)
        
        let dec = aesDecryptMessage(aeskey: cryptkey, sData:enc)!
        print("dec:" + dec)
        
        let deviceinfo = getDeviceInfo()
        print("deviceinfo:" + deviceinfo)
        
    }
    
    private func getlogin(){
        
        let url = "https://nid.naver.com/nidlogin.login"
        let ID = ""
        let PW = ""
       
        let params : [String:String] = [
            "enctp" : "1",
            "encpw" : "0",
            "encnm" : "0",
            "svctype" : "0",
            "svc" : "0",
            "viewtype" : "0",
            "postDataKey" : "0",
            "smart_LEVEL" : "-1",
            "logintp" : "0",
            "localechange" : "0",
            "theme_mode" : "0",
            "ls" : "0",
            "pre_id" : "0",
            "resp" : "0",
            "exp" : "0",
            "ru" : "0",
            "nvlong" : "on",
            "id" : ID,
            "pw" : PW
        ]
        
        let headers : HTTPHeaders = [
            "Referer" : "https://nid.naver.com/nidlogin.login",
            "Content-Type" : "application/x-www-form-urlencoded",
            "User-Agent" : "Mozilla/5.0"
        ]
        
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseString { response in
            
            switch response.result{
            case .success(let value):
                
                print(value)
                
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    private func getBTC(){
       
        let url = "https://api.bithumb.com/public/ticker/BTC"
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { response in
           
            if let json = response.value as? [String:AnyObject]{
                //print(json)
                
                if let status = json["status"] {
                    //print(status)
                }
                
                if let data = json["data"] {
                    //print(data)
                    print(data["acc_trade_value"])
                    print(data["acc_trade_value_24H"])
                    print(data["closing_price"])
                    print(data["fluctate_24H"])
                    print(data["fluctate_rate_24H"])
                    print(data["max_price"])
                    print(data["min_price"])
                    print(data["opening_price"])
                    print(data["prev_closing_price"])
                    print(data["units_traded"])
                    print(data["units_traded_24H"])
                }
                
            }
        }
        
    }
    
}

