import UIKit

class UIViewswipe : UIView {
    
    var swipeLeft : UISwipeGestureRecognizer!
    var swipeRight : UISwipeGestureRecognizer!
    var swipeTop : UISwipeGestureRecognizer!
    var swipeBottom : UISwipeGestureRecognizer!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initswipe()
    }
    
    private func initswipe(){
        
        swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        
        swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        
        swipeTop = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
        swipeTop.direction = UISwipeGestureRecognizer.Direction.up
        
        swipeBottom = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(_:)))
        swipeBottom.direction = UISwipeGestureRecognizer.Direction.down
        
        self.addGestureRecognizer(swipeLeft)
        self.addGestureRecognizer(swipeRight)
        self.addGestureRecognizer(swipeTop)
        self.addGestureRecognizer(swipeBottom)
    }
    
    private func deleteswipe(){
        
        self.removeGestureRecognizer(swipeLeft)
        self.removeGestureRecognizer(swipeRight)
        self.removeGestureRecognizer(swipeTop)
        self.removeGestureRecognizer(swipeBottom)
    }
    
    @objc func swipeGesture(_ sender : UISwipeGestureRecognizer){
        
        if sender.state == .ended {
            
            if sender.direction == .left{
                
                let originalPoint = self.center.x
                self.center.x = -((self.superview?.frame.width)!)
               
                let animator = UIViewPropertyAnimator(duration: 1.5, dampingRatio: 0.5, animations: nil)
                animator.addAnimations({
                    self.center.x = originalPoint
                })
                animator.startAnimation()
                
            } else if sender.direction == .right {
                
                let originalPoint = self.center.x
                self.center.x = ((self.superview?.frame.width)! + self.frame.width)
                
                let animator = UIViewPropertyAnimator(duration: 1.5, dampingRatio: 0.5, animations: nil)
                animator.addAnimations({
                    self.center.x = originalPoint
                })
                animator.startAnimation()
                
            } else if sender.direction == .up {
                
                let originalPoint = self.center.y
                self.center.y = ((self.superview?.frame.height)!)
                
                let animator = UIViewPropertyAnimator(duration: 1.5, dampingRatio: 0.5, animations: nil)
                animator.addAnimations({
                    self.center.y = originalPoint
                })
                animator.startAnimation()
                
            } else if sender.direction == .down {
                
                let originalPoint = self.center.y
                self.center.y = -((self.superview?.frame.height)!)
                
                let animator = UIViewPropertyAnimator(duration: 1.5, dampingRatio: 0.5, animations: nil)
                animator.addAnimations({
                    self.center.y = originalPoint
                })
                animator.startAnimation()
            }
        }
        
    }
    
}
