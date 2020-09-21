
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var leadingview: NSLayoutConstraint!
    
    var isOpenSideMenu = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leadingview.constant = -300
    }
    
    @IBAction func sideMenu(_ sender: Any) {
        
        if (isOpenSideMenu){
            
            leadingview.constant = -300
            
            UIView.animate(withDuration: 0.3, delay: 0.1, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            })
            
        } else{
            
            leadingview.constant = 0
            
            UIView.animate(withDuration: 0.3, delay: 0.1, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.view.layoutIfNeeded()
            })
        }
        
        isOpenSideMenu = !isOpenSideMenu
    }
    
}

