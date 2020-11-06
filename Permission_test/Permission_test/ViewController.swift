
import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("푸시 알림 권한 허용")
                UNUserNotificationCenter.current().delegate = self
            } else {
                print("푸시 알림 권한 거부")
            }
        }
    }

    @IBAction func btnClick(_ sender: Any) {
        
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["noti1"])
        
        let content = UNMutableNotificationContent()
        
        content.title = "제목"
        content.subtitle = "서브 제목"
        content.body = "내용"
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.userInfo = ["id" : "id", "pwd" : "pwd"]
        
        if let url = Bundle.main.url(forResource: "img1.png", withExtension: "png") {
            
            if let attachment = try? UNNotificationAttachment(identifier: UUID().uuidString, url: url, options: nil) {
                
                content.attachments = [attachment]
            }
        }
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler:  nil)
        
    }
    
}

extension ViewController : UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print(response.notification.request.content.userInfo["id"] ?? 0)
        print(response.notification.request.content.userInfo["pwd"] ?? 0)
        
        completionHandler()
    }
    
}
