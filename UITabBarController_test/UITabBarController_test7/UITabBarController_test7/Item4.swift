import UIKit

class Item4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellow
    }
    
    @IBAction func btn_close(_ sender: Any) {
        
        //root로 이동
        self.navigationController?.popToRootViewController(animated: true)
        
        //바로 전으로 이동
        //self.navigationController?.popViewController(animated: true)
    }
}
