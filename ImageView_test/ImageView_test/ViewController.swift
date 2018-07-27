
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var img2: BorderRoundImageView!
    
    @IBOutlet weak var img3: RoundImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //img1
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(img1Tapped))
        img1.addGestureRecognizer(tapGesture)
        img1.isUserInteractionEnabled = true
        
        //img2
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(img2Tapped))
        img2.addGestureRecognizer(tapGesture2)
        img2.isUserInteractionEnabled = true
        
        //img3
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(img3Tapped))
        img3.addGestureRecognizer(tapGesture3)
        img3.isUserInteractionEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func img1Tapped() {
        print("img1Tapped")
    }

    @objc func img2Tapped() {
        print("img2Tapped")
    }

    @objc func img3Tapped() {
        print("img3Tapped")
    }
}

