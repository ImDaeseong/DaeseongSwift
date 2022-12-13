
import UIKit
import MultilineTextField

class item2: UIViewController {

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
    
    var linkData : [String] = []
    
    @IBOutlet weak var et1: UITextView!
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
    }
    

    @IBAction func btn_Click(_ sender: Any) {
        
        let sValue = et1.text!
        
        //링크 검색
        linkData = []
        getLink(sInput: sValue)
        
        //textview 링크 설정
        let mutalbeattributedString = NSMutableAttributedString(string: sValue)
        for item in linkData {
            
            //print("\(item)")
            mutalbeattributedString.setLink(sInput: item, sLinkUrl: item)
        }
        tv1.attributedText = mutalbeattributedString
    }
    
    private func getLink(sInput : String) -> Void {
        
        let lines = sInput.split(separator: "\n")
        for item in lines {
            
            let nStart = String(item).find(sInput: "https")
            if nStart > -1 {
                
                let slast = String(item).substring(from: nStart)
                
                let nEnd = String(slast).find(sInput: " ")
                if nEnd != -1 {
                    
                    linkData.append( String(slast).substring(from: 0, to: nEnd) )
                } else {
                    
                    linkData.append( String(slast).substring(from: 0, to: slast.count) )
                }
                
            }
        }
    }

}


public extension NSMutableAttributedString {
    
    func setLink(sInput : String, sLinkUrl : String) -> Bool {
        
        let range = self.mutableString.range(of: sInput)
        if range.location != NSNotFound {
            
            self.addAttribute(.link, value: sLinkUrl, range: range)
            return true
        }
        return false
    }
}

public extension String {
    
    func find(sInput : String) -> Int {
        
        let range = self.range(of: sInput)
        if range == nil {
            return -1
        } else {
            return self.distance(from: self.startIndex, to: range!.lowerBound)
        }
    }
    
    func substring(from: Int) -> String {
        
        var nStart = self.startIndex
        if from >= 0 {
            nStart = self.index(self.startIndex, offsetBy: from)
        } else {
            nStart = self.index(self.startIndex, offsetBy: from)
        }
        return String(self[nStart..<self.endIndex])
    }
    
    func substring(from: Int, to: Int) -> String {
        
        let nStart = self.index(self.startIndex, offsetBy: from)
        let nEnd = self.index(self.startIndex, offsetBy: to)
        return String(self[nStart..<nEnd])
    }
}
