
import UIKit
import FacebookCore
import FacebookLogin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //facebook 로그인
    @IBAction func btn1_clikc(_ sender: UIButton) {
        
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [.publicProfile, .email], viewController: self) { (result) in
            
            switch result {
            case .cancelled:
                print("취소")
                break
            case .failed(let error):
                print("실패:\(error.localizedDescription)")
                break
            case .success(let granted, let declined, let token):
                print("성공 granted:\(granted) declined:\(declined) token:\(token)")
                self.getInfo()
                break
            }
        }
    }
    
    //로그인 성공시 정보
    func getInfo(){
        
        GraphRequest(graphPath: "me", parameters: ["field" : "id, name, email"]).start { (connection, result, error) -> Void in
            
            if error == nil {
                
                guard let facebook = result as? [String:AnyObject] else { return }
                //print(facebook)
                
                let id = facebook["id"] as? String
                let name = facebook["name"] as? String
                let email = facebook["email"] as? String
               
                print("id:\(id)")
                print("name:\(name)")
                print("email:\(email)")
                
            } else {
                
                print(error?.localizedDescription)
            }
        }
        
    }
    
}

