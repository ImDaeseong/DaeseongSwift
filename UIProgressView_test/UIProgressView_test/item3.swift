import UIKit

class item3: UIViewController {
    
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var progressview1: UIProgressViewEx1!
    
    private let maxValue = 100
    
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
        progressview1.progress = 50 / Float(maxValue)
    }
    
    @objc func img1Tapped() {
        dismiss(animated: false, completion: nil)
    }
    
}
