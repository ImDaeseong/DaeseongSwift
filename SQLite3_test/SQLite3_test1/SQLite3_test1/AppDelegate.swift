import UIKit
import SQLite3

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var db: OpaquePointer? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        copyLotto()
        
        return true
    }
    
    func copyLotto(){
        
        let fileMgr = FileManager.default
        let docPath = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first
        let dbPath = docPath!.appendingPathComponent("LottoDB.db").path
        
        if fileMgr.fileExists(atPath: dbPath) == false {
            
            let dbSource = Bundle.main.path(forResource: "LottoDB", ofType: "db")
            
            do {
            
                try fileMgr.copyItem(atPath: dbSource!, toPath: dbPath)
                
            } catch _ {
                
                print("file copy error")
            }
        }
        
        if sqlite3_open(dbPath, &db) == SQLITE_OK {
            //print("dbPath:\(dbPath)")
        } else {
            //print("dbPath failed")
            db = nil
        }
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

