
import UIKit
import MultilineTextField

class item1: UIViewController {

    let data = "서울          서울         서울\n" +
        "구름많음\n" +
        "온도 1.6°\n" +
        "미세 좋음\n" +
        "초미세 좋음\n" +
        "https://weather.naver.com/today/01110580?cpName=KMA 링크 처리 1 \n" +
        "\n" +
        " 춘천         춘천 \n" +
        "<!--구름많음-->\n" +
        "   링크 처리 2 https://weather.naver.com/today/01150101?cpName=KMA\n" +
        "\n" +
        "강릉__강릉\n" +
        "<!--흐림-->\n" +
        "  온도 5.6° https://weather.naver.com/today/16113114?cpName=KMA   링크 처리 3\n" +
        "\n" +
        "!청주       청주!\n" +
        "초미세 좋음 https://weather.naver.com/today/07170630?cpName=KMA 링크 처리 4  <!--흐림-->\n" +
        "\n" +
        "@대전                            대전#\n" +
        "미세 보통\n" +
        "초미세 보통\n" +
        "링크 처리 5 https://m.naver.com   링크 처리 5\n" +
        "\n";
    
    
    @IBOutlet weak var et1: MultilineTextField!
    @IBOutlet weak var tv1: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        et1.backgroundColor = .white
        et1.layer.borderWidth = 1
        et1.layer.borderColor = UIColor.blue.cgColor
        et1.textColor = UIColor.black
        et1.font = UIFont.systemFont(ofSize: 15.0)
        et1.textAlignment = NSTextAlignment.left
        et1.text = data
        
        tv1.backgroundColor = .white
        tv1.layer.borderWidth = 1
        tv1.layer.borderColor = UIColor.blue.cgColor
        tv1.textColor = UIColor.black
        tv1.font = UIFont.systemFont(ofSize: 15.0)
        tv1.textAlignment = NSTextAlignment.left
        tv1.isEditable = false
        tv1.allowsEditingTextAttributes = false
        
        //링크 자동 감지
        tv1.dataDetectorTypes = [.link]
    }
    
    @IBAction func btn_Click(_ sender: Any) {
        
        tv1.text = data
    }
    
}
