
import UIKit
import SQLite3

class ViewController: UIViewController {

    var db:OpaquePointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            db = delegate.db
        }
    }
    
    @IBAction func btn1_click(_ sender: Any) {
        
        //총개수
        //let nTotalcount = getLottoRowCount()
        //print("nTotalcount:\(nTotalcount)")
        
        
        /*
        //선택 정보 조회
        var aryLotto : [Lotto] = []
        aryLotto = getData(rIndex: 1)
        print("aryLotto:\(aryLotto)")
        print("aryLotto[0].rIndex:\(aryLotto[0].rIndex)")
        */
        
        
        //삭제
        //let bDelete = deleteLotto(rIndex: 825)
        //print("bDelete:\(bDelete)")
        
        
        //업데이트
        //let bUpdate = updateLotto(Date: "2002.12.07", Part1: "10", Part2: "23", Part3: "29", Part4: "33", Part5: "37", Part6: "40", Bonus: "16", rIndex: 1)
        //print("bUpdate:\(bUpdate)")
        
        //추가
        //let bInsert = insertLotto(rIndex: 825, Date: "2020.12.12", Part1: "1", Part2: "2", Part3: "3", Part4: "4", Part5: "5", Part6: "6", Bonus: "7")
        //print("bInsert:\(bInsert)")
        
        
        /*
        //전체 데이터 조회
        var allLotto : [Lotto] = []
        allLotto = getLotto()
        for item in allLotto {
            print("item.rIndex:\(item.rIndex) item.Date:\(item.Date) item.Bonus:\(item.Bonus)")
        }
        */
        
        
        //부분별 가장 많은 수 조회
        //let TopPart = getPartTop(nPart:6)
        //print("TopPart:\(TopPart)")
        
      
        //전체 가장 많은 수 60개 조회
        var LottoTop : [LottoTop] = []
        LottoTop.append(contentsOf: getLottoTop(nPart: 1))
        LottoTop.append(contentsOf: getLottoTop(nPart: 2))
        LottoTop.append(contentsOf: getLottoTop(nPart: 3))
        LottoTop.append(contentsOf: getLottoTop(nPart: 4))
        LottoTop.append(contentsOf: getLottoTop(nPart: 5))
        LottoTop.append(contentsOf: getLottoTop(nPart: 6))
        
        var i : Int = 0
        for item in LottoTop.sorted(by: { $0.nCount > $1.nCount }) {
            i += 1
            print("제일 많은순으로:\(i)  item.sPart:\(item.sPart) item.nCount:\(item.nCount)")
        }
        
    }
    
    //많은순 60개 조회
    func getLottoTop(nPart : Int) -> [LottoTop] {
        
        var aryLottoTop : [LottoTop] = []
        
        if db != nil {
            
            var queryStatement : OpaquePointer? = nil
            var query : String = ""
            
            if nPart == 1 {
            
                query = "Select Part1, count(*) as cnt FROM Lotto GROUP BY Part1 order by cnt desc limit 10"
            } else if nPart == 2 {
            
                query = "Select Part2, count(*) as cnt FROM Lotto GROUP BY Part2 order by cnt desc limit 10"
            } else if nPart == 3 {
           
                query = "Select Part3, count(*) as cnt FROM Lotto GROUP BY Part3 order by cnt desc limit 10"
            } else if nPart == 4 {
            
                query = "Select Part4, count(*) as cnt FROM Lotto GROUP BY Part4 order by cnt desc limit 10"
            } else if nPart == 5 {
           
                query = "Select Part5, count(*) as cnt FROM Lotto GROUP BY Part5 order by cnt desc limit 10"
            } else if nPart == 6 {
            
                query = "Select Part6, count(*) as cnt FROM Lotto GROUP BY Part6 order by cnt desc limit 10"
            }
           
            
            if sqlite3_prepare(db, query, -1, &queryStatement, nil) == SQLITE_OK {
                
                while sqlite3_step(queryStatement) == SQLITE_ROW {
                    
                    let sPart = String(cString: sqlite3_column_text(queryStatement, 0))
                    let nCount = Int(sqlite3_column_int(queryStatement, 1))
                    
                    let item = LottoTop(sPart : sPart, nCount : nCount)
                    aryLottoTop.append(item)
                }
            }
            
            sqlite3_finalize(queryStatement)
        }
        
        return aryLottoTop
    }
    
    func getPartTop(nPart : Int) -> String {
        
        var lottoPart : String = ""
        
        if db != nil {
            
            var queryStatement : OpaquePointer? = nil
            var query : String = ""
            
            if nPart == 1 {
            
                query = "Select Part1, count(*) as cnt FROM Lotto GROUP BY Part1 order by cnt desc limit 1"
            } else if nPart == 2 {
            
                query = "Select Part2, count(*) as cnt FROM Lotto GROUP BY Part2 order by cnt desc limit 1"
            } else if nPart == 3 {
           
                query = "Select Part3, count(*) as cnt FROM Lotto GROUP BY Part3 order by cnt desc limit 1"
            } else if nPart == 4 {
            
                query = "Select Part4, count(*) as cnt FROM Lotto GROUP BY Part4 order by cnt desc limit 1"
            } else if nPart == 5 {
           
                query = "Select Part5, count(*) as cnt FROM Lotto GROUP BY Part5 order by cnt desc limit 1"
            } else if nPart == 6 {
            
                query = "Select Part6, count(*) as cnt FROM Lotto GROUP BY Part6 order by cnt desc limit 1"
            }
            
            if sqlite3_prepare(db, query, -1, &queryStatement, nil) == SQLITE_OK {
                
                while sqlite3_step(queryStatement) == SQLITE_ROW {
                    
                    lottoPart = String(cString: sqlite3_column_text(queryStatement, 0))
                    let nCount = Int(sqlite3_column_int(queryStatement, 1))
                    
                    //print("lottoPart:\(lottoPart)")
                    //print("nCount:\(nCount)")
                }
            }
            
            sqlite3_finalize(queryStatement)
        }
        
        return lottoPart
    }
    
    //추가
    func insertLotto(rIndex : Int, Date : String, Part1 : String, Part2 : String, Part3 : String, Part4 : String, Part5 : String, Part6 : String, Bonus : String) -> Bool {
        
        var bInsert : Bool = false
        
        if db != nil {
            
            var queryStatement : OpaquePointer? = nil
            let query = "Insert into Lotto(rIndex, Date, Part1, Part2, Part3, Part4, Part5, Part6, Bonus) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);"
            
            if sqlite3_prepare(db, query, -1, &queryStatement, nil) == SQLITE_OK {
                
                sqlite3_bind_int(queryStatement, 1, Int32(rIndex))
                sqlite3_bind_text(queryStatement, 2, (Date as NSString).utf8String, -1, nil)
                sqlite3_bind_text(queryStatement, 3, (Part1 as NSString).utf8String, -1, nil)
                sqlite3_bind_text(queryStatement, 4, (Part2 as NSString).utf8String, -1, nil)
                sqlite3_bind_text(queryStatement, 5, (Part3 as NSString).utf8String, -1, nil)
                sqlite3_bind_text(queryStatement, 6, (Part4 as NSString).utf8String, -1, nil)
                sqlite3_bind_text(queryStatement, 7, (Part5 as NSString).utf8String, -1, nil)
                sqlite3_bind_text(queryStatement, 8, (Part6 as NSString).utf8String, -1, nil)
                sqlite3_bind_text(queryStatement, 9, (Bonus as NSString).utf8String, -1, nil)
                
                if sqlite3_step(queryStatement) == SQLITE_DONE {
                    
                    bInsert = true
                }
            }
            
            sqlite3_finalize(queryStatement)
        }
        
        return bInsert
    }
    
    //전체 개수
    func getLottoRowCount() -> Int {
        
        var nTotalcount : Int = 0
        
        if db != nil {
            
            var queryStatement : OpaquePointer? = nil
            let query = "Select count(*) FROM Lotto"
            
            if sqlite3_prepare(db, query, -1, &queryStatement, nil) == SQLITE_OK {
                
                while sqlite3_step(queryStatement) == SQLITE_ROW {
                    
                    nTotalcount = Int(sqlite3_column_int(queryStatement!, 0))
                }
            }
            
            sqlite3_finalize(queryStatement)
        }
        return nTotalcount
    }
    
    //업데이트
    func updateLotto(Date : String, Part1 : String , Part2 : String, Part3 : String, Part4 : String, Part5 : String, Part6 : String, Bonus : String, rIndex : Int) -> Bool {
        
        var bUpdate : Bool = false
        
        if db != nil {
            
            var queryStatement : OpaquePointer? = nil
            let query = "UPDATE Lotto SET Date = ?, Part1 = ?, Part2 = ?, Part3 = ?, Part4 = ?, Part5 = ?, Part6 = ?, Bonus = ? WHERE rIndex = ?"
            
            if sqlite3_prepare(db, query, -1, &queryStatement, nil) == SQLITE_OK {
                
                sqlite3_bind_text(queryStatement, 1, (Date as NSString).utf8String, -1, nil)
                sqlite3_bind_text(queryStatement, 2, (Part1 as NSString).utf8String, -1, nil)
                sqlite3_bind_text(queryStatement, 3, (Part2 as NSString).utf8String, -1, nil)
                sqlite3_bind_text(queryStatement, 4, (Part3 as NSString).utf8String, -1, nil)
                sqlite3_bind_text(queryStatement, 5, (Part4 as NSString).utf8String, -1, nil)
                sqlite3_bind_text(queryStatement, 6, (Part5 as NSString).utf8String, -1, nil)
                sqlite3_bind_text(queryStatement, 7, (Part6 as NSString).utf8String, -1, nil)
                sqlite3_bind_text(queryStatement, 8, (Bonus as NSString).utf8String, -1, nil)
                sqlite3_bind_int(queryStatement, 9, Int32(rIndex))
                
                if sqlite3_step(queryStatement) == SQLITE_DONE {
                    
                    bUpdate = true
                }
            }
            
            sqlite3_finalize(queryStatement)
        }
        
        return bUpdate
    }
    
    //삭제
    func deleteLotto(rIndex : Int) -> Bool {
        
        var bDelete : Bool = false
        
        if db != nil {
            
            var queryStatement : OpaquePointer? = nil
            let query = "Delete FROM Lotto where rIndex = \(rIndex)"
            
            if sqlite3_prepare(db, query, -1, &queryStatement, nil) == SQLITE_OK {
                
                if sqlite3_step(queryStatement) == SQLITE_DONE {
                    
                    bDelete = true
                }
            }
            
            sqlite3_finalize(queryStatement)
        }
        
        return bDelete
    }
    
    //선택된 데이터
    func getData(rIndex : Int) -> [Lotto] {
        
        var aryLotto : [Lotto] = []
        
        if db != nil {
            
            var queryStatement : OpaquePointer? = nil
            let query = "Select * FROM Lotto where rIndex = \(rIndex)"
            
            if sqlite3_prepare(db, query, -1, &queryStatement, nil) == SQLITE_OK {
                
                while sqlite3_step(queryStatement) == SQLITE_ROW {
                    
                    let rIndex = Int(sqlite3_column_int(queryStatement!, 0))
                    let Date = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                    let Part1 = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                    let Part2 = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                    let Part3 = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                    let Part4 = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                    let Part5 = String(describing: String(cString: sqlite3_column_text(queryStatement, 6)))
                    let Part6 = String(describing: String(cString: sqlite3_column_text(queryStatement, 7)))
                    let Bonus = String(describing: String(cString: sqlite3_column_text(queryStatement, 8)))
                    
                    let item = Lotto(rIndex : rIndex, Date : Date, Part1 : Part1, Part2 : Part2, Part3 : Part3, Part4 : Part4, Part5 : Part5, Part6 : Part6, Bonus : Bonus)
                    aryLotto.append(item)
                }
            }
            
            sqlite3_finalize(queryStatement)
        }
        
        return aryLotto
    }
    
    //전체 데이터
    func getLotto() -> [Lotto] {
        
        var aryLotto : [Lotto] = []
        
        if db != nil {
            
            var queryStatement : OpaquePointer? = nil
            let query = "Select * FROM Lotto ORDER BY rIndex DESC"
            
            if sqlite3_prepare(db, query, -1, &queryStatement, nil) == SQLITE_OK {
                
                while sqlite3_step(queryStatement) == SQLITE_ROW {
                    
                    let rIndex = Int(sqlite3_column_int(queryStatement!, 0))
                    let Date = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                    let Part1 = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                    let Part2 = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                    let Part3 = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                    let Part4 = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                    let Part5 = String(describing: String(cString: sqlite3_column_text(queryStatement, 6)))
                    let Part6 = String(describing: String(cString: sqlite3_column_text(queryStatement, 7)))
                    let Bonus = String(describing: String(cString: sqlite3_column_text(queryStatement, 8)))
                    
                    let item = Lotto(rIndex : rIndex, Date : Date, Part1 : Part1, Part2 : Part2, Part3 : Part3, Part4 : Part4, Part5 : Part5, Part6 : Part6, Bonus : Bonus)
                    aryLotto.append(item)
                }
            }
            
            sqlite3_finalize(queryStatement)
        }
        
        return aryLotto
    }
    
}

