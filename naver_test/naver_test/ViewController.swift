
import UIKit
import NaverThirdPartyLogin
import Alamofire

class ViewController: UIViewController {
    
    let instance = NaverThirdPartyLoginConnection.getSharedInstance()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        instance?.delegate = self
    }
    
    //로그인
    @IBAction func btn1_click(_ sender: UIButton) {
        
        instance?.requestThirdPartyLogin()
    }
    
    //로그아웃
    @IBAction func btn2_click(_ sender: Any) {
        
        instance?.requestDeleteToken()
    }

}

extension ViewController : NaverThirdPartyLoginConnectionDelegate {
    
    func oauth20ConnectionDidOpenInAppBrowser(forOAuth request: URLRequest!) {
        print("네이버앱 미설치")
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("로그인")
        getInfo()
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        print("이미 로그인중")
        instance?.accessToken
    }
    
    func oauth20ConnectionDidFinishDeleteToken() {
        print("로그아웃")
    }
    
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("error:\(error.localizedDescription)")
    }
    
    func getInfo(){
        
        guard let isValidtoken = instance?.isValidAccessTokenExpireTimeNow() else { return }
        
        if !isValidtoken {
            return
        }
        
        guard let tokenType = instance?.tokenType else { return }
        guard let accessToken = instance?.accessToken else { return }
        
        let url = "https://openapi.naver.com/v1/nid/me"
        let author = "\(tokenType) \(accessToken)"
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization" : author]).responseJSON { (response) in
            
            guard let result = response.value as? [String :Any] else { return }
            //print(result)
            
            guard let object = result["response"] as? [String :Any] else { return }
            //print(object)
            
            guard let id = object["id"] as? String else { return }
            guard let name = object["name"] as? String else { return }
            guard let email = object["email"] as? String else { return }
            
            print("id:\(id)")
            print("name:\(name)")
            print("email:\(email)")
        }
        
    }
}
