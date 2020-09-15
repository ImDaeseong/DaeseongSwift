
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func Toast(sMessage : String){
        
        let label = UILabel(frame: CGRect(x: 10, y: self.view.frame.height - 100, width: self.view.frame.width - (20), height: 30))
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.backgroundColor = UIColor.lightGray
        label.textColor = .orange
        label.textAlignment = .center
        label.layer.borderWidth = 0.2
        label.layer.cornerRadius = 10
        label.layer.borderColor = UIColor.orange.cgColor
        label.clipsToBounds = true
        label.text = sMessage
        label.alpha = 1
        self.view.addSubview(label)
        
        UIView.animate(withDuration: 1.0, delay: 0.1, options: .curveEaseOut, animations: {
            label.alpha = 0
        }, completion: { (isCompleted) in
            label.removeFromSuperview()
        })
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        
        Toast(sMessage : "toast test")
    }
    
    @IBAction func btn2_click(_ sender: UIButton) {
        
        let toast = ToastEx1(w: self.view.frame.width, h: self.view.frame.height)
        let label : UILabel = toast.show(sMessage : "toast test")
        self.view.addSubview(label)
        
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            label.alpha = 0
        }, completion: { (isCompleted) in
            label.removeFromSuperview()
        })
        
    }
    
}

