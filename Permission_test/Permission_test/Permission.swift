
import Foundation
import Photos
import UserNotifications
import Contacts
import CoreLocation

struct  Permission {
    
    struct Camera {
        static var hasPermission : Bool {
            return AVCaptureDevice.authorizationStatus(for: .video) == .authorized
        }
        
        static func request(_ completion: @escaping() -> Void) {
            AVCaptureDevice.requestAccess(for: .video) { granted in
                completion()
            }
        }
    }
    
    
    
    
}
