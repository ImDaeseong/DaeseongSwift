import UIKit

class item3: UIViewController {
    
    @IBOutlet weak var img1: ImageViewEx2!
    
    @IBOutlet weak var img2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let img = UIImage(named: "img4.png")
        //view.layer.contents = img?.cgImage
        
        view.backgroundColor = UIColor.white
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(img1Tapped))
        img1.addGestureRecognizer(tapGesture1)
        img1.isUserInteractionEnabled = true
        
        img2.alpha = 0.5//1.0
    }
    
    @objc func img1Tapped() {
        dismiss(animated: false, completion: nil)
    }
}
