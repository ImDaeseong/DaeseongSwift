
import UIKit

class ViewController: UIViewController {

    var db:DbHelper = DbHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_click(_ sender: Any) {
        
        //총개수
        let nTotalcount = db.getLottoRowCount()
        print("nTotalcount:\(nTotalcount)")
        
        
        //전체 데이터 조회
        var allLotto : [Lotto] = []
        allLotto = db.getLotto()
        for item in allLotto {
            print("item.rIndex:\(item.rIndex) item.Date:\(item.Date) item.Bonus:\(item.Bonus)")
        }
        
        //추가
        let bInsert1 = db.insertLotto(rIndex: 1, Date: "2020.12.12", Part1: "1", Part2: "2", Part3: "3", Part4: "4", Part5: "5", Part6: "6", Bonus: "7")
        print("bInsert1:\(bInsert1)")
        
        let bInsert2 = db.insertLotto(rIndex: 2, Date: "2020.12.12", Part1: "1", Part2: "2", Part3: "3", Part4: "4", Part5: "5", Part6: "6", Bonus: "7")
        print("bInsert2:\(bInsert2)")
    }
}

