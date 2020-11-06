
import UIKit
import Photos
import UserNotifications
import Contacts
import CoreLocation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var locationManager = CLLocationManager()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        permissionLocation()
        permissionCamera()
        permissionPhoto()
        permissionMicro()
        permissionAddress()
        permissionPush()
        
        return true
    }
    
    func permissionLocation(){
        
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            
            switch CLLocationManager.authorizationStatus() {
            case .authorizedAlways, .authorizedWhenInUse:
                print("위치 권한 허용")
                locationManager.startUpdatingLocation()
            case .restricted, .notDetermined, .denied:
                print("위치 권한 거부")
            default:
                break
            }
        }
    }
    
    func permissionCamera(){
        
        AVCaptureDevice.requestAccess(for: .video) { (granted : Bool) in
            if granted {
                print("카메라 권한 허용")
            } else {
                print("카메라 권한 거부")
            }
        }
    }
    
    func permissionPhoto(){
        
        PHPhotoLibrary.requestAuthorization( { status in
            
            switch status {
            case .authorized:
                print("사진 권한 허용")
            case .denied:
                print("사진 권한 거부")
            case .restricted, .notDetermined:
                print("사진 선택하지 않음")
            default:
                break
            }
            
        })
    }
    
    func permissionMicro() {
        
        AVAudioSession.sharedInstance().requestRecordPermission { (granted : Bool) in
            if granted {
                print("음성 권한 허용")
            } else {
                print("음성 권한 거부")
            }
        }
    }
    
    func permissionAddress(){
        
        CNContactStore().requestAccess(for: .contacts) { (granted, error) in
            if granted {
                print("주소 연락처 권한 허용")
            } else {
                print("주소 연락처 권한 거부")
            }
        }
    }
    
    func permissionPush(){
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("푸시 알림 권한 허용")
            } else {
                print("푸시 알림 권한 거부")
            }
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

