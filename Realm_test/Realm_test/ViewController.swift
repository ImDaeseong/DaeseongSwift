import UIKit

class ViewController: UIViewController {
    
    //var alarm : [Alarm] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        list()
    }
    
    @IBAction func btn1_click(_ sender: Any) {
        
        //전체 삭제
        realmManager.SharedInstance.deleteAll()
        
        
        //추가
        add()
        
        
        //수정
        //update()
        
        
        //검색
        //search(searchkey : "sub")
        
        
        //삭제
        //realmManager.SharedInstance.delete(id : 8)
        
        
        //삭제
        //delete(selectid : 1)
        
        
        //조회
        list()
    }
    
    
    //전체 리스트
    private func list() {
        
        let nCount : Int = realmManager.SharedInstance.getCount()
        print("getCount:\(nCount)")
        
        let val : [Alarm] = realmManager.SharedInstance.selectAll()
        for item in val {
            let id = item.id
            let title = item.title
            let content = item.content
            let writeDate = item.writeDate
            print("id:\(id) title:\(title) content:\(content) writeDate:\(writeDate)")
        }
    }
    
    //삭제
    private func delete(selectid : Int){
        
        let val : [Alarm] = realmManager.SharedInstance.selectAll()
        for item in val {
            if item.id == selectid {
                realmManager.SharedInstance.delete(alarm : item)
            }
        }
    }
    
    //검색
    private func search(searchkey : String) {
        
        let val : [Alarm] = realmManager.SharedInstance.search(searchkey : searchkey)
        for item in val {
            let id = item.id
            let title = item.title
            let content = item.content
            let writeDate = item.writeDate
            print("id:\(id) title:\(title) content:\(content) writeDate:\(writeDate)")
        }
    }
    
    //수정
    private func update() {
      
        for i in 1...20 {
            
            let val1 = String(format: "제목 - sub%d", i)
            let val2 = String(format: "내용 - content%d", i)
            realmManager.SharedInstance.updateAlarm(title : val1, content : val2, id : i)
        }
    }
    
    //추가
    private func add() {
        
        for i in 1...10 {
            let val1 = String(format: "title%d", i)
            let val2 = String(format: "content%d", i)
            
            if (realmManager.SharedInstance.isAlarm(id : i) == false) {
                realmManager.SharedInstance.addAlarm(title : val1, content : val2)
            }
        }
        
        for i in 11...20 {
            
            let alarm = Alarm()
            alarm.title = String(format: "sub%d", i)
            alarm.content = String(format: "subcontent%d", i)
            
            if (realmManager.SharedInstance.isAlarm(id : i) == false) {
                realmManager.SharedInstance.addAlarm(alarm : alarm)
            }
        }
    }
}

