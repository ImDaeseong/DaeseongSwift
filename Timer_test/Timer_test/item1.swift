import UIKit

class item1: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var imgview1: UIImageView!
    
    var vTimer : Timer!
    var nCount = 0
    
    var itemArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view1.addGestureRecognizer(tap1)
        
        for i in 0 ..< 4 {
            //print(i)
            let img = UIImage(named: "img\(i+1).png")
            itemArray.append(img!)
        }
        
        imgview1.image = UIImage(named: "img1.png")
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
        if(nCount > 3){
            nCount = 0
        }
        //print(nCount)
        imgview1.image = itemArray[nCount]
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
            
            //넓이,높이 변경
            //btn.transform = CGAffineTransform(scaleX: 2.1, y: 2.1)
            
            //위치 이동
            //btn.transform = CGAffineTransform(translationX: 10, y: 10)
            
            //회전
            btn.transform = CGAffineTransform(rotationAngle: .pi)
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.1){
                btn.transform = CGAffineTransform.identity
            }
        }
    }
    
}
