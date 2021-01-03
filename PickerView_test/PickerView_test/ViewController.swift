
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerview1: UIPickerView!
    
    var imgs = ["img1.png", "img2.png", "img3.png", "img4.png", "img5.png" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerview1.backgroundColor = UIColor.gray
        
        pickerview1.delegate = self
        pickerview1.dataSource = self
    }
}

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        var attributeStr = NSAttributedString()
        attributeStr = NSAttributedString(string: imgs[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.orange])
        
        return attributeStr
    }
    
    //컴포넌트 수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //데이터 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return imgs.count
    }
    
    //제목 설정
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return imgs[row]
    }
    
    /*
    //높이
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return 100
    }
    */
    
    //선택된 경우
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        print(imgs[row])
    }
}
