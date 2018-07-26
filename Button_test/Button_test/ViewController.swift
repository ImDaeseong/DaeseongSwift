import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var btn1: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //btn1
        btn1.layer.borderWidth = 1
        btn1.layer.borderColor = UIColor.black.cgColor//btn1.tintColor.cgColor
        btn1.backgroundColor = UIColor.gray
        btn1.setTitleColor(UIColor.orange, for: UIControlState.normal)
        btn1.layer.cornerRadius = 5
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btn1(_ sender: UIButton) {
        print("btn1")
    }

    
    @IBAction func btn2(_ sender: UIButton) {
        print("btn2")
    }
    
    
    @IBAction func btn3(_ sender: BorderRoundButton) {
        print("btn3")
    }
    
    
    @IBAction func btn4(_ sender: RoundButton) {
        print("btn4")
    }
    
    
}

