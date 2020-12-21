import UIKit

class ViewController: UIViewController {

    var db:DbHelper = DbHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_click(_ sender: Any) {
        
        //총개수
        //let nTotalcount = db.getLottoRowCount()
        //print("nTotalcount:\(nTotalcount)")
        
        
        
        /*
        //선택 정보 조회
        var aryLotto : [Lotto] = []
        aryLotto = db.getData(rIndex: 1)
        print("aryLotto:\(aryLotto)")
        print("aryLotto[0].rIndex:\(aryLotto[0].rIndex)")
        */
        
        
        //삭제
        //let bDelete = db.deleteLotto(rIndex: 825)
        //print("bDelete:\(bDelete)")
                              
        
        //업데이트
        //let bUpdate = db.updateLotto(Date: "2002.12.07", Part1: "10", Part2: "23", Part3: "29", Part4: "33", Part5: "37", Part6: "40", Bonus: "16", rIndex: 1)
        //print("bUpdate:\(bUpdate)")
        
        //추가
        //let bInsert = db.insertLotto(rIndex: 825, Date: "2020.12.12", Part1: "1", Part2: "2", Part3: "3", Part4: "4", Part5: "5", Part6: "6", Bonus: "7")
        //print("bInsert:\(bInsert)")
        
        
        /*
        //전체 데이터 조회
        var allLotto : [Lotto] = []
        allLotto = db.getLotto()
        for item in allLotto {
            print("item.rIndex:\(item.rIndex) item.Date:\(item.Date) item.Bonus:\(item.Bonus)")
        }
        */
        
        
        //부분별 가장 많은 수 조회
        //let TopPart = db.getPartTop(nPart:6)
        //print("TopPart:\(TopPart)")
        
      
        //전체 가장 많은 수 60개 조회
        var LottoTop : [LottoTop] = []
        LottoTop.append(contentsOf: db.getLottoTop(nPart: 1))
        LottoTop.append(contentsOf: db.getLottoTop(nPart: 2))
        LottoTop.append(contentsOf: db.getLottoTop(nPart: 3))
        LottoTop.append(contentsOf: db.getLottoTop(nPart: 4))
        LottoTop.append(contentsOf: db.getLottoTop(nPart: 5))
        LottoTop.append(contentsOf: db.getLottoTop(nPart: 6))
        
        var i : Int = 0
        for item in LottoTop.sorted(by: { $0.nCount > $1.nCount }) {
            i += 1
            print("제일 많은순으로:\(i)  item.sPart:\(item.sPart) item.nCount:\(item.nCount)")
        }
        
    }
}

