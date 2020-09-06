
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        
        
        let sResult1 = "C:/Program Files/Internet Explorer/iexplore.exe"
        print("getExt: \(getExt(sInput: sResult1)!)")
        print("getName: \(getName(sInput: sResult1)!)")
        print("getUpper: \(getUpper(sInput: sResult1)!)")
        print("getLower: \(getLower(sInput: sResult1)!)")
        print("getSubString: \(getSubString(sInput: sResult1, sStart: ":/", sEnd: "/")!)")
        print("getLeft: \(getLeft(sInput: sResult1, length: 10)!)")
        print("getRight: \(getRight(sInput: sResult1, length: 12)!)")
        print("getTime: \(getTime())")
        
        
        let sResult2 : String = "사과,감자,파인애플,귤,포도,당근,고구마"
        print("getSplitFirst: \(getSplitFirst(sInput: sResult2, sType: ",")!)")
        print("getSplitFirstA: \(getSplitFirstA(sInput: sResult2, sType: ",")!)")
        print("getSplitLast: \(getSplitLast(sInput: sResult2, sType: ",")!)")
        print("getSplitLastA: \(getSplitLastA(sInput: sResult2, sType: ",")!)")
        print("getReplace: \(getReplace(sInput : sResult2, sFind : ",", sReplace : "|")!)")
        
        let splits = getSplit(sInput: sResult2, sType: ",")!
        for item in splits {
            print("getSplit: \(item)")
        }
        
        
        let sResult3 : String = "     앞에공백제거  마지막공백제거      "
        print("getTrim:\(getTrim(sInput : sResult3)!)")
    
        
        
        let length1 : Double = 1023
        let length2 : Double = (1024 * 1000)
        let length3 : Double = (1024 * 1024 * 345)
        let length4 : Double = (1024 * 1024 * 1024 * 245)
        print("getFileSize: \(getFileSize(size : length1)!)")
        print("getFileSize: \(getFileSize(size : length2)!)")
        print("getFileSize: \(getFileSize(size : length3)!)")
        print("getFileSize: \(getFileSize(size : length4)!)")
        
        
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        let startDate = dateFormat.date(from: "2020-09-01")!
        let endDate = dateFormat.date(from: "2020-09-02")!
        print("getDateSubtract: \(getDateSubtract(from : startDate, to : endDate))")
        print("getTimeSubtract: \(getTimeSubtract(from : startDate, to : endDate))")
        
        
        
        
    }
    
}

