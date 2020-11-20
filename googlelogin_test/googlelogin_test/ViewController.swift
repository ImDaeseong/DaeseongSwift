import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    //로그인
    @IBAction func btn1_click(_ sender: UIButton) {
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @IBAction func btn2_click(_ sender: UIButton) {
        
        //로그아웃
        GIDSignIn.sharedInstance()?.signOut()
        
        //연동해제
        GIDSignIn.sharedInstance()?.disconnect()
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        /*
        if error != nil {
            print(user.userID)
        }
        */
        
        if let error = error {
            print("구글 연결 error:\(error.localizedDescription)")
            return
        }
        
        guard let authentication = user.authentication else {
            return
        }
        
        if let userid = user.userID,
            let idToken = user.authentication.idToken,
            let fullname = user.profile.name,
            let givenName = user.profile.givenName,
            let familyName = user.profile.familyName,
            let email = user.profile.email {
            
            print("userid:\(userid)")
            print("idToken:\(idToken)")
            print("fullname:\(fullname)")
            print("givenName:\(givenName)")
            print("familyName:\(familyName)")
            print("email:\(email)")
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
        print("구글 연결 해제")
    }

}

