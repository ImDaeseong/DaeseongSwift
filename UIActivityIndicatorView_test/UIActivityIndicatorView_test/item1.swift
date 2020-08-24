import UIKit

class item1: UIViewController {
    
    @IBOutlet weak var indicator1: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator1.center = self.view.center
        indicator1.hidesWhenStopped = true //animate 중지시 화면에서 hide
        indicator1.style = UIActivityIndicatorView.Style.whiteLarge
        indicator1.startAnimating()
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        
        if indicator1.isAnimating {
            indicator1.stopAnimating()
        }else{
            indicator1.startAnimating()
        }
    }
}
