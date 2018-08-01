
import UIKit

var imgs = ["a.jpg", "b.jpg", "c.jpg", "d.jpg"]

class ViewController: UIViewController {

    
    @IBOutlet weak var img1: UIImageView!
    
    var counts : Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        img1.image = UIImage(named: imgs[0])
        
        let swipeGestueRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeGestueRight.direction = UISwipeGestureRecognizerDirection.right
        img1.addGestureRecognizer(swipeGestueRight)
        
        let swipeGestueDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeGestueDown.direction = UISwipeGestureRecognizerDirection.down
        img1.addGestureRecognizer(swipeGestueDown)
        
        let swipeGestueLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeGestueLeft.direction = UISwipeGestureRecognizerDirection.left
        img1.addGestureRecognizer(swipeGestueLeft)
        
        let swipeGestueUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeGestueUp.direction = UISwipeGestureRecognizerDirection.up
        img1.addGestureRecognizer(swipeGestueUp)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func respondToSwipeGesture(_ send : UIGestureRecognizer) {
        
        if let swipeGesture = send as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
             
            case UISwipeGestureRecognizerDirection.right:
                print("right")
                changeImage(direct: true)
                
            case UISwipeGestureRecognizerDirection.down:
                print("down")
                
            case UISwipeGestureRecognizerDirection.left:
                print("left")
                changeImage(direct: false)
                
            case UISwipeGestureRecognizerDirection.up:
                print("up")
                
            default:
                break
            }
        }
    }
    
    private func changeImage(direct : Bool) {
        
        if direct == true {
            
            counts += 1
            if counts > 3 {
                counts = 0
            }
            
        } else {
         
            counts -= 1
            if counts < 0 {
                counts = 3
            }
        }
        
        print("\(counts)")
        img1.image = UIImage(named: imgs[counts])
    }
    

}

