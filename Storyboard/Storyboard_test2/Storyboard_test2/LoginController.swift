import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btn1_click(_ sender: Any) {
        
        //메인 화면으로
        let rootVC = UIStoryboard.init(name: "Root", bundle: nil).instantiateViewController(withIdentifier: "RootDetail")
        self.navigationController?.pushViewController(rootVC, animated: true)
    }
}
