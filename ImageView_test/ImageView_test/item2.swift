import UIKit

class item2: UIViewController {
    
    @IBOutlet weak var img1: ImageViewEx2!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let img = UIImage(named: "img4.png")
        //view.backgroundColor = UIColor(patternImage: img!)
        
        view.backgroundColor = UIColor.white
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(img1Tapped))
        img1.addGestureRecognizer(tapGesture1)
        img1.isUserInteractionEnabled = true
        
    }
    
    @objc func img1Tapped() {
        
        dismiss(animated: false, completion: nil)
    }
    
}
