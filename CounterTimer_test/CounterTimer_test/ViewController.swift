
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbltimer: UILabel!
    
    var counterTimer = Timer()
    var counter = 0
    
    private func startTimer(){
        
        counterTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)) , userInfo: nil ,repeats: true)
    }
    
    private func stopTimer(){
        
        initDisplay()
        counterTimer.invalidate()
    }
    
    @objc func updateTimer(){
        counter = counter + 1
        lbltimer.text = String(format: "%d", counter)
        
        if counter >= 30 {
            counterTimer.invalidate()
        }
        
    }
    
    private func initDisplay(){
        lbltimer.text = "0"
        counter = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnStart(_ sender: UIButton) {
        
        
        stopTimer()
        startTimer()
    }
    
    
    @IBAction func btnStop(_ sender: UIButton) {
        stopTimer()
    }
    
}

