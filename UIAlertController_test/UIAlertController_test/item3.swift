import UIKit

class item3: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    
    var alertController : UIAlertController!
    var alertSelect1 : UIAlertAction!
    var alertSelect2 : UIAlertAction!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        
        alertController = UIAlertController(title: nil, message: "선택 메시지", preferredStyle: .alert)
        
        alertSelect1 = UIAlertAction(title: "선택1", style: .default, handler: nil)
        alertSelect2 = UIAlertAction(title: "선택2", style: .default, handler: nil)
        
        alertController.addAction(alertSelect1)
        alertController.addAction(alertSelect2)
        
        self.present(alertController, animated: true) {
            print("show")
        }
    }
    
}

