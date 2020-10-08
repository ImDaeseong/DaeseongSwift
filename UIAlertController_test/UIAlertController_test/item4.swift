import UIKit

class item4: UIViewController {
    
    var alertController : UIAlertController!
    var alertOk : UIAlertAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        
        alertController = UIAlertController(title: "제목", message: "메시지", preferredStyle: .alert)
        alertOk = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(alertOk)
        alertController.view.tintColor = UIColor.orange
        self.present(alertController, animated: true, completion: nil)
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { (timer : Timer) in
            self.alertController.dismiss(animated: true, completion: nil)
        })
        
    }
}
