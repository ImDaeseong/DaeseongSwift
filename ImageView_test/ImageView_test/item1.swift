import UIKit

class item1: UIViewController {
    
    @IBOutlet weak var img1: ImageViewEx2!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(img1Tapped))
        img1.addGestureRecognizer(tapGesture1)
        img1.isUserInteractionEnabled = true
        
    }
    
    @objc func img1Tapped() {
        
        dismiss(animated: false, completion: nil)
    }
    
}
