
import UIKit
import MarqueeLabel

class ViewController: UIViewController {

    @IBOutlet weak var label1: MarqueeLabel!
    
    @IBOutlet weak var label2: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMarqueeLabel()
        
    }
    
    private func initMarqueeLabel(){
        
        self.label1.textColor = .orange
        //self.label1.backgroundColor = .lightGray
        
        self.label1.animationCurve = .easeInOut
        self.label1.type = .continuous
        self.label1.speed = .duration(15)
        self.label1.fadeLength = 10.0
        
        self.label1.text = "MarqueeLabel1 MarqueeLabel2 MarqueeLabel3"
    }
  
}

