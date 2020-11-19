import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //로그인 버튼
    @IBAction func btn1_click(_ sender: UIButton) {
        
        guard let session = KOSession.shared() else { return }
        
        if session.isOpen() {
            session.close()
        }
        
        session.open(completionHandler: { (error) -> Void in
            
            if !session.isOpen() {
                
                if let error = error as NSError? {
                    switch  error.code {
                    case Int(KOErrorCancelled.rawValue):
                        break
                    default:
                        print("error")
                    }
                }
                
            } else {
                
                print("로그인 성공시 정보를 가져온다")
                
                KOSessionTask.userMeTask{ (error, user) in
                    
                    guard let user = user,
                          let email = user.account?.email,
                          let name = user.account?.profile?.nickname,
                    let id = user.id else { return }
                    
                    print("email:\(email)")
                    print("name:\(name)")
                    print("id:\(id)")
                    
                }
                
            }
            
        })
    }
    
    //로그 아웃 버튼
    @IBAction func btn2_click(_ sender: UIButton) {
        
        guard let session = KOSession.shared() else { return }
        
        session.logoutAndClose { (success, error) in
            
            if success {
                print("로그 아웃 성공")
            } else {
                print(error?.localizedDescription)
            }
        }
        
    }
    
}

