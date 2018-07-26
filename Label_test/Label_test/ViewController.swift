
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var lbl2: UILabel!
    
    @IBOutlet weak var lbl3: BorderRoundLabel!
    
    @IBOutlet weak var lbl4: BorderRoundLabel!
    
    @IBOutlet weak var lbl5: UnderLineLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.text = "lbl1"
        lbl2.text = "lbl2"
        lbl3.text = "lbl3"
        lbl4.text = "lbl4"
        lbl5.text = "lbl5 lbl5 lbl5 lbl5"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

