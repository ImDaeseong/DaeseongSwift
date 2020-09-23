import UIKit

class item3: UIViewController {
    
    @IBOutlet weak var imageview1: UIImageView!
    
    var pinGesture : UIPinchGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pinGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinGesture(pin:)))
        imageview1.isUserInteractionEnabled = true
        imageview1.addGestureRecognizer(pinGesture)
    }
    
    @objc func pinGesture(pin: UIPinchGestureRecognizer) {
        
        guard pin.view != nil else { return }
        
        if pin.state == .began || pin.state == .changed {
            pin.view?.transform = (pin.view?.transform.scaledBy(x: pin.scale, y: pin.scale))!
            pin.scale = 1.0
        }
    }
}
