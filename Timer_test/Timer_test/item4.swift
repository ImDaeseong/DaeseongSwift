import UIKit

class item4: UIViewController {
    
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var label1: UILabel!
    var vTimer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch1.setOn(false, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //print("viewDidDisappear")
        
        stopTimer()
    }
    
    @IBAction func switch1_changed(_ sender: Any) {
        
        if (switch1.isOn){
            startTimer()
        }else{
            stopTimer()
        }
    }
    
    private func startTimer(){
        
        //1초 주기
        if vTimer == nil {
            vTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (vTimer) in
                self.updateTimer()
            })
        }
    }
    
    private func stopTimer(){
        
        if vTimer != nil {
            vTimer.invalidate()
            vTimer = nil
        }
    }
    
    @objc func updateTimer(){
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        label1.text = formatter.string(from: today)
    }
}
