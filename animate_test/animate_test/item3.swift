import UIKit

class item3: UIViewController {
    
    @IBOutlet weak var imgview1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //left
    @IBAction func btn1_click(_ sender: Any) {
        
        let originalPoint = self.imgview1.center.x
        self.imgview1.center.x = -((self.view?.frame.width)!)
  
        UIView.animate(withDuration: 0.5, animations: {self.imgview1.center.x = originalPoint})
    }
    
    //right
    @IBAction func btn2_click(_ sender: Any) {
        
        let originalPoint = self.imgview1.center.x
        self.imgview1.center.x = ((self.view?.frame.width)! + self.imgview1.frame.width)
        //self.imgview1.center.x = ((self.view?.frame.width)!)
        
        UIView.animate(withDuration: 0.5, animations: {self.imgview1.center.x = originalPoint})
    }
    
    //top
    @IBAction func btn3_click(_ sender: Any) {
        
        let originalPoint = self.imgview1.center.y
        self.imgview1.center.y = ((self.view?.frame.height)!)
        
        UIView.animate(withDuration: 0.5, animations: {self.imgview1.center.y = originalPoint})
    }
    
    //bottom
    @IBAction func btn4_click(_ sender: Any) {
        
        let originalPoint = self.imgview1.center.y
        self.imgview1.center.y = -((self.view?.frame.height)!)
        
        UIView.animate(withDuration: 0.5, animations: {self.imgview1.center.y = originalPoint})
    }
    
}


