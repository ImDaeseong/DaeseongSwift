
import UIKit

class item1: UIViewController {
    
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var progressview1: UIProgressView!
    
    @IBOutlet weak var label1: UILabel!
    
    private let maxValue = 100
    
    var vTimer : Timer!
    var nCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(img1Tapped))
        img1.addGestureRecognizer(tapGesture1)
        img1.isUserInteractionEnabled = true
        
        //배경색
        progressview1.trackTintColor = UIColor.white
        
        //퍼센트색
        progressview1.progressTintColor = UIColor.orange
        
        progressview1.progressViewStyle = .default
        
        //값 초기화
        progressview1.progress = 0
        label1.text = ""
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopTimer()
    }
    
    @objc func img1Tapped() {
        dismiss(animated: false, completion: nil)
    }
    
    private func startTimer(){
        
        //1초 주기
        if vTimer == nil {
            vTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: (#selector(updateTimer)) , userInfo: nil ,repeats: true)
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
        
        if (nCount <= maxValue) {
            progressview1.progress =  Float(nCount) / Float(maxValue)
            label1.text = "\(nCount) / \(maxValue)"
        }else{
            nCount = 0
            progressview1.progress =  0
            label1.text = "\(nCount) / \(maxValue)"
        }
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        startTimer()
    }
    
    @IBAction func btn2_click(_ sender: UIButton) {
        stopTimer()
    }
}
