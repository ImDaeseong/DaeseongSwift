import UIKit

class item2: UIViewController {
    
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var view1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view1.backgroundColor = UIColor.red.withAlphaComponent(0.55)
        self.view1.layer.cornerRadius = 5
        self.view1.layer.borderWidth = 1.5
        self.view1.layer.borderColor = UIColor.orange.cgColor
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view1.addGestureRecognizer(tap1)
        
        //텍스트 에디트 설정
        self.textfield1.placeholder = "값을 입력하세요"
        self.textfield1.tintColor = UIColor.white
        self.textfield1.textColor = UIColor.orange
        self.textfield1.backgroundColor = UIColor.lightGray
        self.textfield1.borderStyle = .line
        self.textfield1.layer.borderColor = UIColor.orange.cgColor
        self.textfield1.layer.borderWidth = 1.0
        self.textfield1.contentHorizontalAlignment = .center
        self.textfield1.contentVerticalAlignment = .center
        
        //텍스트 에디트에 포커스
        textfield1.becomeFirstResponder()
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //텍스트 입력 시작할때
    @IBAction func editingDidBegin(_ sender: UITextField) {
        print("텍스트 입력 시작할때")
    }
    
    //텍스트 입력 중일때
    @IBAction func editingChanged(_ sender: UITextField) {
        print("텍스트 입력 중일때")
    }
    
    //텍스트 입력에서 벗어날때
    @IBAction func DidEndOnExit(_ sender: UITextField) {
        
        print("텍스트 입력에서 벗어날때")
        
        //키보드 숨기기
        textfield1.resignFirstResponder()
    }
}
