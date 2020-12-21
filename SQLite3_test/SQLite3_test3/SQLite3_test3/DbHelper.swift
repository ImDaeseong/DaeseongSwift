import Foundation
import SQLite3

class DbHelper {
    
    let dbPath : String = "LottoDB.db"
    var db: OpaquePointer? = nil
    
    init() {
        
        self.db = openDatabase()
        
        //let bDrop = dropTable()
        //print("bDrop:\(bDrop)")
        
        let bCreate = creatTable()
        print("bCreate:\(bCreate)")
    }
    
    func openDatabase() -> OpaquePointer? {
        
        var db: OpaquePointer? = nil
        
        let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dbPath)
        
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK {
            
            return nil
        }
        
        return db
    }
    
    func creatTable() -> Bool {
        
        var bCreate : Bool = false
        
        if self.db != nil {
            
            var queryStatement : OpaquePointer? = nil
            
            let query = "create table if not exists Lotto ( " +
                                "rIndex INTEGER PRIMARY KEY," +
                                "Date  TEXT," +
                                "Part1 TEXT," +
                                "Part2 TEXT," +
                                "Part3 TEXT," +
                                "Part4 TEXT," +
                                "Part5 TEXT," +
                                "Part6 TEXT," +
                                "Bonus TEXT);"
            
            if sqlite3_prepare_v2(db, query, -1, &queryStatement, nil) == SQLITE_OK {
                
                if sqlite3_step(queryStatement) == SQLITE_DONE {
                    
                    bCreate = true
                }
            }
            
            sqlite3_finalize(queryStatement)
        }
        
        return bCreate
    }
    
    func dropTable() -> Bool {
        
        var bDrop : Bool = false
        
        if self.db != nil {
            
            var queryStatement : OpaquePointer? = nil
            
            let query = "drop table Lotto"
            
            if sqlite3_prepare_v2(db, query, -1, &queryStatement, nil) == SQLITE_OK {
                
                if sqlite3_step(queryStatement) == SQLITE_DONE {
                    
                    bDrop = true
                }
            }
            
            sqlite3_finalize(queryStatement)
        }
        
        return bDrop
    }
    
    //추가
    func insertLotto(rIndex : Int, Date : String, Part1 : String, Part2 : String, Part3 : String, Part4 : String, Part5 : String, Part6 : String, Bonus : String) -> Bool {
        
        var bInsert : Bool = false
        
        if self.db != nil {
            
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
        
        if self.db != nil {
            
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
    
    //전체 데이터
    func getLotto() -> [Lotto] {
        
        var aryLotto : [Lotto] = []
        
        if self.db != nil {
            
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
