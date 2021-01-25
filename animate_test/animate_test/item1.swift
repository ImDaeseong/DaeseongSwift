import UIKit

class item1: UIViewController {
    
    @IBOutlet weak var imgview1: UIImageView!
    
    var bshow : Bool = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgview1.isHidden = true
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        imgview1.isHidden = false
        imgview1.frame.origin.x = view.frame.width
    }
    
    //default
    @IBAction func btn1_click(_ sender: Any) {
        
        if (bshow == true) {
            
            bshow = false
            let centerX = view.frame.width + self.imgview1.frame.width
            UIView.animate(withDuration: 0.5, animations: {self.imgview1.center.x = centerX})
            
        } else {
            
            bshow = true
            let centerX = view.center.x
            UIView.animate(withDuration: 0.5, animations: {self.imgview1.center.x = centerX})
        }
    }
    
    //curveEaseOut
    @IBAction func btn2_click(_ sender: Any) {
        
        if (bshow == true) {
            
            bshow = false
            let centerX = view.frame.width + self.imgview1.frame.width
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                self.imgview1.center.x = centerX
            })
            
        } else {
            
            bshow = true
            let centerX = view.center.x
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                self.imgview1.center.x = centerX
            })
        }
    }
    
    //curveEaseIn
    @IBAction func btn3_click(_ sender: Any) {
        
        if (bshow == true) {
            
            bshow = false
            let centerX = view.frame.width + self.imgview1.frame.width
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                self.imgview1.center.x = centerX
            })
            
        } else {
            
            bshow = true
            let centerX = view.center.x
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                self.imgview1.center.x = centerX
            })
        }
    }
    
    //curveLinear
    @IBAction func btn4_click(_ sender: Any) {
        
        if (bshow == true) {
            
            bshow = false
            let centerX = view.frame.width + self.imgview1.frame.width
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
                self.imgview1.center.x = centerX
            })
            
        } else {
            
            bshow = true
            let centerX = view.center.x
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveLinear, animations: {
                self.imgview1.center.x = centerX
            })
        }
    }
    
}

