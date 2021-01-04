
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textview1: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textview1.delegate = self
        
        //textview1.keyboardType = .numberPad
        
        //키보드 자동 완성 기능 off
        textview1.autocorrectionType = UITextAutocorrectionType.no
        
        textview1.text = "내용을 입력해주세요"
        textview1.textColor = UIColor.lightGray
        textview1.tintColor = UIColor.orange
        //textview1.backgroundColor = .clear
        
        textview1.layer.borderWidth = 1
        textview1.layer.cornerRadius = 5
        textview1.layer.borderColor = UIColor.orange.cgColor
        
        textview1.becomeFirstResponder()
        
    }
}

extension ViewController : UITextViewDelegate {
    
    //데이터 편집시작
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.textColor == UIColor.lightGray {
            textview1.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    //데이터 편집중
    func textViewDidChange(_ textView: UITextView) {
        
    }
    
    //데이터 편집종료
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text.isEmpty {
            textview1.text = "내용을 입력해주세요"
            textView.textColor = UIColor.lightGray
        }
    }
    
    //리턴 입력시 키보드 숨김
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if (text == "\n") {
            textView.resignFirstResponder()
        }
        
        return true
    }
}
