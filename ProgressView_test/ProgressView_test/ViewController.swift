
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var progress2: UIProgressView!
    
    @IBOutlet weak var progress3: UIProgressView!
    
    @IBOutlet weak var progress4: UIProgressView!
    
    @IBOutlet weak var progress5: UIProgressView!
    
    var timer : Timer!
    var counts : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        progress2.setProgress(0.5, animated: true)
        progress2.progressTintColor = UIColor.orange
        progress2.trackTintColor = UIColor.white
        
        
        progress3?.progress = 0.5
        progress3?.trackTintColor = UIColor.gray
        progress3?.tintColor = UIColor.orange
        
        
        progress4.progress = 0.0
        progress4.trackTintColor = UIColor.clear
        progress4.progressTintColor = UIColor.orange
        progress4.layer.cornerRadius = 4
        
        
        progress5.progress = 0
        progress5.tintColor = UIColor.orange
        progress5.layer.cornerRadius = 4
        startTimer()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target : self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats : true )
    }

    @objc private func updateTimer(){
        counts += 1
        
        if counts <= 10 {
            progress5.progress = Float(counts) / 10
            print("\(counts * 10)%")
        } else {
            timer.invalidate()
        }
        
    }
    

}

