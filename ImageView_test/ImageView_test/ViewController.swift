
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgview1: UIImageView!
    
    @IBOutlet weak var imgview2: UIImageView!
    
    @IBOutlet weak var imgview3: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(imgview1Tapped))
        imgview1.addGestureRecognizer(tapGesture1)
        imgview1.isUserInteractionEnabled = true
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(imgview2Tapped))
        imgview2.addGestureRecognizer(tapGesture2)
        imgview2.isUserInteractionEnabled = true
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(imgview3Tapped))
        imgview3.addGestureRecognizer(tapGesture3)
        imgview3.isUserInteractionEnabled = true
    }
    
    @objc func imgview1Tapped() {
        
        if let VC1 = storyboard?.instantiateViewController(withIdentifier: "item1") {
            VC1.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            self.present(VC1, animated: true)
        }
    }
    
    @objc func imgview2Tapped() {
        
        if let VC2 = storyboard?.instantiateViewController(withIdentifier: "item2") {
            VC2.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            self.present(VC2, animated: true)
        }
    }
    
    @objc func imgview3Tapped() {
        
        if let VC3 = storyboard?.instantiateViewController(withIdentifier: "item3") {
            VC3.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            self.present(VC3, animated: true)
        }
    }
}

