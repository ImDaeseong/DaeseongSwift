import UIKit

class item1: UIViewController {
    
    @IBOutlet weak var img1: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img1.isUserInteractionEnabled = true
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        img1.addGestureRecognizer(tap1)
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        
        self.dismiss(animated: true, completion: nil)
        
        print("imageTapped")
    }
    
}
