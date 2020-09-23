import UIKit

class item5: UIViewController {
    
    @IBOutlet weak var imageview1: UIImageView!
    
    var leftRecognizer : UIScreenEdgePanGestureRecognizer!
    var rightRecognizer : UIScreenEdgePanGestureRecognizer!
    
    var curindex : Int = 0
    var imglist = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initImg()
        
        leftRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(leftScreenEdgeGesture(gesture:)))
        rightRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(rightScreenEdgeGesture(gesture:)))
        
        leftRecognizer.edges = .left
        view.addGestureRecognizer(leftRecognizer)
        
        rightRecognizer.edges = .right
        view.addGestureRecognizer(rightRecognizer)
    }
    
    func initImg(){
        imglist.append(UIImage(named: "img1.png")!)
        imglist.append(UIImage(named: "img2.png")!)
        imglist.append(UIImage(named: "img3.png")!)
        imageview1.image = imglist[curindex]
    }
    
    @objc func leftScreenEdgeGesture(gesture: UIScreenEdgePanGestureRecognizer) {
        if gesture.state == .ended {
        
            if (imglist.count-1) > curindex {
                curindex = curindex + 1
            }else{
                curindex = (imglist.count-1)
            }
            //print("leftScreenEdgeGesture\(curindex)")
            
            imageview1.image = imglist[curindex]
        }
    }
    
    @objc func rightScreenEdgeGesture(gesture: UIScreenEdgePanGestureRecognizer) {
        if gesture.state == .ended {
          
            curindex = curindex - 1
            if curindex < 0 {
                curindex = 0
            }
            //print("rightScreenEdgeGesture\(curindex)")
            
            imageview1.image = imglist[curindex]
        }
    }
}
