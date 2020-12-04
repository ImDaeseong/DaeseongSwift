import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    
    var locationManager : CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        
        //앱이 포그라운드에 있을 경우 위치 접근 허가 요청
        locationManager?.requestWhenInUseAuthorization()
        
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager?.delegate = self
            
            //배터리에 맞게 권장되는 최적의 정확도
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            
            //위치 정보 업데이트 시작
            //locationManager?.startUpdatingLocation()
        }
    }
}

extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //print("위치 데이터 업데이트 처리")
        
        guard let loc: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        //print("atitude=\(loc.latitude) longitude=\(loc.longitude)")
        
        DispatchQueue.main.async {
            self.label1.text = "atitude=\(loc.latitude) longitude=\(loc.longitude)"
        }
        
        //멈추게 하지 않으면 계속 10~20초 사이로 위치 정보 받음
        locationManager?.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("error 처리:\(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        //print("권한 상태 체크")
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            
            //print("권한 없으므로 권한 요청")
            //locationManager?.requestWhenInUseAuthorization()
            break
            
        case .denied, .restricted:
            
            //print("권한 거부 상태")
            break
            
        case .authorizedAlways, .authorizedWhenInUse:
            
            //print("권한 있는 상태으로 위치 정보 업데이트 시작")
            locationManager?.startUpdatingLocation()
            break
            
        default:
            break
        }
        
    }
}
