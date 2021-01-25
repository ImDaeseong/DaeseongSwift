import UIKit

class item2: UIViewController {
    
    @IBOutlet weak var imgview1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    //left
    @IBAction func btn1_click(_ sender: Any) {
        
        //원래 center.x 저장하고 -넓이로 이동시키고, 다시 원래좌표로 복귀
        let originalPoint = self.imgview1.center.x
        self.imgview1.center.x = -((self.view?.frame.width)!)
        
        let animator = UIViewPropertyAnimator(duration: 1.5, dampingRatio: 0.5, animations: nil)
        animator.addAnimations({
            self.imgview1.center.x = originalPoint
        })
        animator.startAnimation()
    }
    
    //right
    @IBAction func btn2_click(_ sender: Any) {
        
        //원래 center.x 저장하고 +넓이로 이동시키고, 다시 원래좌표로 복귀
        let originalPoint = self.imgview1.center.x
        self.imgview1.center.x = ((self.view?.frame.width)! + self.imgview1.frame.width)
        //self.imgview1.center.x = ((self.view?.frame.width)!)
        
        let animator = UIViewPropertyAnimator(duration: 1.5, dampingRatio: 0.5, animations: nil)
        animator.addAnimations({
            self.imgview1.center.x = originalPoint
        })
        animator.startAnimation()
    }
    
    //top
    @IBAction func btn3_click(_ sender: Any) {
        
        //원래 center.y 저장하고 +높이로 이동시키고, 다시 원래좌표로 복귀
        let originalPoint = self.imgview1.center.y
        self.imgview1.center.y = ((self.view?.frame.height)!)
        
        let animator = UIViewPropertyAnimator(duration: 1.5, dampingRatio: 0.5, animations: nil)
        animator.addAnimations({
            self.imgview1.center.y = originalPoint
        })
        animator.startAnimation()
    }
    
    //bottom
    @IBAction func btn4_click(_ sender: Any) {
        
        //원래 center.y 저장하고 -높이로 이동시키고, 다시 원래좌표로 복귀
        let originalPoint = self.imgview1.center.y
        self.imgview1.center.y = -((self.view?.frame.height)!)
        
        let animator = UIViewPropertyAnimator(duration: 1.5, dampingRatio: 0.5, animations: nil)
        animator.addAnimations({
            self.imgview1.center.y = originalPoint
        })
        animator.startAnimation()
    }
    
}
