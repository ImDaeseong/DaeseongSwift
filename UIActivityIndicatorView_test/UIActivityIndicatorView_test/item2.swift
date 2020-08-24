import UIKit

class item2: UIViewController {
    
    @IBOutlet weak var indicator1: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //indicator1.alpha = 0.2
        indicator1.color = UIColor.orange
        indicator1.hidesWhenStopped = true //animate 중지시 화면에서 hide
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

