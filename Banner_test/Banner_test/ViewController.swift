import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindToVC(_ unwindSegue : UIStoryboardSegue) {
        
    }
    
    @IBAction func button1_click(_ sender: Any) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "item1") {
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    @IBAction func button2_click(_ sender: Any) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "item2") {
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    @IBAction func button3_click(_ sender: Any) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "item3") {
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    @IBAction func button4_click(_ sender: Any) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "item4") {
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    @IBAction func button5_click(_ sender: Any) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "item5") {
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: false, completion: nil)
        }
    }
    
}

