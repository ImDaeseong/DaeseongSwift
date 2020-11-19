
import UIKit
import  Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.showFCMToken(notification:)), name: Notification.Name("FCMToken"), object: nil)
    }

    @objc func showFCMToken(notification : Notification){
        
        guard  let userInfo = notification.userInfo else {
            return
        }
        
        print("userInfo: \(userInfo)")
        
        /*
        if let token = userInfo["token"] as? String {
            print("token: \(token)")
        }
        */
    }

    @IBAction func btn1_click(_ sender: UIButton) {
        
        if let token = Messaging.messaging().fcmToken {
            print("token:\(token)")
        }
    }
}

