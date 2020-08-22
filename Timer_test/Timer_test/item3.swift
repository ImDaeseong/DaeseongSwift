import UIKit

class item3: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var imgview1: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    
    var itemArray = [UIImage]()
    
    var vTimer : Timer!
    var nCount = 0
    var nIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view1.addGestureRecognizer(tap1)
        
        addUIImage()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear")
        stopTimer()
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        startTimer()
        btnAnimate(sender)
    }
    
    @IBAction func btn2_clikc(_ sender: UIButton) {
        stopTimer()
        btnAnimate(sender)
    }
    
    private func startTimer(){
        
        //1초 주기
        if vTimer == nil {
            vTimer = Timer.scheduledTimer(timeInterval: 0.15, target: self, selector: (#selector(updateTimer)) , userInfo: nil ,repeats: true)
        }
    }
    
    private func stopTimer(){
        
        if vTimer != nil {
            vTimer.invalidate()
            vTimer = nil
        }
    }
    
    @objc func updateTimer(){
        
        DispatchQueue.main.async {
            
            self.nCount = self.nCount + 1
            //print(self.nCount)
            
            //time
            let hours = Int(self.nCount) / 3600
            let minutes = Int(self.nCount) / 60 % 60
            let seconds = Int(self.nCount) % 60
            self.label1.text = String(format: "%02i:%02i:%02i", hours, minutes, seconds)
            
            
            //sprite img
            self.nIndex = self.nIndex + 1
            //print(self.nIndex)
            if(self.nIndex > 13){
                self.nIndex = 0
            }
            self.imgview1.image = self.itemArray[self.nIndex]
        }
    }
    
    func btnAnimate(_ btn: UIButton) {
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn , animations: {
            
            btn.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            btn.alpha = 0.9
            
        }) { (_) in
            
            UIView.animate(withDuration: 0.1){
                btn.transform = CGAffineTransform.identity
            }
        }
    }
    
    func addUIImage(){
    
        let imgtemp = UIImage(named : "imgsprite.png")!
        let imgsprite : CGImage = imgtemp.cgImage!
        
        let rows = 3
        let columns = 5
        var Posx = 0
        var Posy = 0
        
        let realwidth = Int(imgsprite.width / columns)
        let realheight = Int(imgsprite.height / rows)
        
        for i in 0...13 {
            
            Posx = ( i % columns) * realwidth
            Posy = ( i / columns) * realheight
            
            let rect : CGRect = CGRect(x: Posx, y: Posy, width: realwidth, height: realheight)
            let imgcrop : CGImage = imgsprite.cropping(to: rect)!
            let imgindex = UIImage(cgImage: imgcrop)
            itemArray.append(imgindex)
        }
        imgview1.image = itemArray[0]
        
    }
    
}

