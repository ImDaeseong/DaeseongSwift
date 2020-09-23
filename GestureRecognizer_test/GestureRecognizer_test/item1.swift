import UIKit

class item1: UIViewController {
    
    var swipeLeft : UISwipeGestureRecognizer!
    var swipeRight : UISwipeGestureRecognizer!
    var swipeLeftMulti : UISwipeGestureRecognizer!
    var swipeRightMulti : UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(item1.swipeGesture(_:)))
        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(item1.swipeGesture(_:)))
        
        swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(item1.swipeGestureMulti(_:)))
        swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(item1.swipeGestureMulti(_:)))
        
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightMulti.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(swipeRightMulti)
    }
    
    @objc func swipeGesture(_ gesture: UIGestureRecognizer) {
        
        if let swipe = gesture as? UISwipeGestureRecognizer {
            switch swipe.direction {
            case UISwipeGestureRecognizer.Direction.left:
                print("left")
            case UISwipeGestureRecognizer.Direction.right:
                print("right")
            default:
                break
            }
        }
    }
    
    @objc func swipeGestureMulti(_ gesture: UIGestureRecognizer) {
        
        if let swipe = gesture as? UISwipeGestureRecognizer {
            switch swipe.direction {
            case UISwipeGestureRecognizer.Direction.left:
                print("Multi left")
            case UISwipeGestureRecognizer.Direction.right:
                print("Multi right")
            default:
                break
            }
        }
    }
}
