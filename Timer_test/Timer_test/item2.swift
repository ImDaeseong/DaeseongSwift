import UIKit

class item2: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var label1: UILabel!
    
    var vTimer : Timer!
    var nCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view1.addGestureRecognizer(tap1)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //print("viewDidDisappear")
        
        stopTimer()
    }

    @objc func viewTapped(_ sender: UITapGestureRecognizer){
        self.dismiss(animated: true, completion: nil)
    }
    
    private func startTimer(){
        
        //1초 주기
        if vTimer == nil {
            vTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: (#selector(updateTimer)) , userInfo: nil ,repeats: true)
        }
    }
    
    private func stopTimer(){
        
        if vTimer != nil {
            vTimer.invalidate()
            vTimer = nil
        }
    }
    
    @objc func updateTimer(){
        
        nCount = nCount + 1
        //print(nCount)
        
        let hours = Int(nCount) / 3600
        let minutes = Int(nCount) / 60 % 60
        let seconds = Int(nCount) % 60
        
        label1.text = String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        startTimer()
        btnAnimate(sender)
    }
    
    @IBAction func btn2_click(_ sender: UIButton) {
        stopTimer()
        btnAnimate(sender)
    }
    
    func btnAnimate(_ btn: UIButton) {
        
        UIView.animate(withDuration: 0.1, animations: {
            
            btn.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.1){
                btn.transform = CGAffineTransform.identity
            }
        }
    }
    
}
