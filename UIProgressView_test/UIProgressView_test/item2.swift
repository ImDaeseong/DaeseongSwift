import UIKit

class item2: UIViewController {
    
    @IBOutlet weak var img1: UIImageView!
    
    @IBOutlet weak var progressview1: UIProgressView!
    
    @IBOutlet weak var label1: UILabel!
    
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
        
        progressview1.progressViewStyle = .bar
        
        
        //값 초기화
        progressview1.progress = 10 / Float(maxValue)
        label1.text = ""
        
    }
    
    @objc func img1Tapped() {
        dismiss(animated: false, completion: nil)
    }
    
    func progressview1Tapped() {
        
        print(progressview1.progress * Float(maxValue))
    }
    
}
