
import UIKit
import Firebase
import UserNotifications


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let gcmMessageIDKey = "gcm.message_ID"
     
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        
        
        if #available(iOS 10.0, *) {
            
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: {_, _ in })
            
        } else {
            
            let settings : UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        application.registerForRemoteNotifications()
        
        /*
        if let token = Messaging.messaging().fcmToken {
           print("이미 등록된 토큰이 있는지 token:\(token)")
        }
        */
        
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        
        if let messageID = userInfo[gcmMessageIDKey] {
            print("didReceiveRemoteNotification message ID: \(messageID)")
        }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        if let messageID = userInfo[gcmMessageIDKey] {
            print("didReceiveRemoteNotification message ID: \(messageID)")
        }
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
    
    //end receive message
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
        print("didFailToRegisterForRemoteNotificationsWithError Error: \(error.localizedDescription)")
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
       
        //print("didRegisterForRemoteNotificationsWithDeviceToken deviceToken : \(deviceToken)")
        
        Messaging.messaging().apnsToken = deviceToken
    }
    

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

@available(iOS 10, *)
extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    
        let userInfo = notification.request.content.userInfo
       
        if let messageID = userInfo[gcmMessageIDKey] {
            print("message ID: \(messageID)")
        }
        
        //print("포그라운드 푸시 수신 userInfo: \(userInfo)")
        
        completionHandler([.alert, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo
        
        if let messageID = userInfo[gcmMessageIDKey] {
            print("message ID: \(messageID)")
        }
        
        //print("백그라운드 body : \(response.notification.request.content.body)")
        //print("백그라운드 푸시 수신 userInfo: \(userInfo)")
        
        /*
        if response.actionIdentifier == UNNotificationDismissActionIdentifier {
            print("close")
        } else if response.actionIdentifier == UNNotificationDefaultActionIdentifier {
            print("click")
        }
        
        switch UIApplication.shared.applicationState {
        case .active:
            print("active")
            break
        case .inactive:
            print("inactive")
            break
        case .background:
            print("background")
            break
        }
        */
        
        /*
        let gcmMessageID = userInfo["gcm.message_id"] as? String ?? ""
        print("gcmMessageID : ", gcmMessageID)
        
        let aps = userInfo["aps"] as? [String:Any]
        let alert = aps?["alert"] as? [String:Any]

        let title = alert?["title"] as? String ?? ""
        let body = alert?["body"] as? String ?? ""
        
        print("title : ", title)
        print("body : ", body)
        */
        
        completionHandler()
    }
}

extension AppDelegate: MessagingDelegate {
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        
        //print("didReceiveRegistrationToken fcmToken: \(fcmToken!)")
        
        let dataDict : [String:String] = ["token" : fcmToken!]
        NotificationCenter.default.post(name: NSNotification.Name("FCMToken"), object: nil, userInfo: dataDict)
        
    }
    
    
}

