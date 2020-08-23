import UIKit

class item2: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view1.backgroundColor = UIColor.red.withAlphaComponent(0.55)
        self.view1.layer.cornerRadius = 5
        self.view1.layer.borderWidth = 1.5
        self.view1.layer.borderColor = UIColor.orange.cgColor
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view1.addGestureRecognizer(tap1)
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
