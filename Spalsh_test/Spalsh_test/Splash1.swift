
import UIKit

protocol Splash1Delegate {
    func callMain()
}

class Splash1: UIViewController {
    
    @IBOutlet weak var imageview1: UIImageView!
    
    var delegate: Splash1Delegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(callMain), userInfo: nil, repeats: false)
    }
    
    @objc func callMain(){
        delegate?.callMain()
    }
}
