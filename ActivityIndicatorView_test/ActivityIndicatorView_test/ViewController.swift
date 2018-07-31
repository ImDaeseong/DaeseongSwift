
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var indicator1: UIActivityIndicatorView!
    
    
    @IBOutlet weak var indicator2: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator1.alpha = 0.0
        
        
        indicator2.color = UIColor.orange
        indicator2.startAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startBtn(_ sender: Any) {
        
        indicator1.alpha = 1.0
        indicator1.startAnimating()
    }
    
    
    @IBAction func stopBtn(_ sender: Any) {
        
        indicator1.alpha = 0.2
        indicator1.stopAnimating()
    }
    
}

