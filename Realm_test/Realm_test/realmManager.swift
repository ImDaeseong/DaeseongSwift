import RealmSwift
import Foundation

class realmManager {
    
    public static let SharedInstance = realmManager()
    
    private static let realm = try! Realm()
    
    private func getData() -> String{
        
        let dataFormat = DateFormatter()
        dataFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dataFormat.string(from: Date())
    }
    
    //전체 개수
    public func getCount() -> Int {
        
        let result = realmManager.realm.objects(Alarm.self)
        return result.count
    }
    
    //max id
    public func getMaxId() -> Int {
        
        var Id : Int = 1
        
        let result = realmManager.realm.objects(Alarm.self).max(ofProperty: "id") as Int?
        
        if (result != nil) {
            Id = result! + 1
        }
        return Id
    }
    
    //전체 삭제
    public func deleteAll() {
        
        let result = realmManager.realm.objects(Alarm.self)
        
        if result.count > 0 {
      
            try! realmManager.realm.write() {
                realmManager.realm.delete(result)
            }
        }
    }
    
    //선택 삭제
    public func delete(alarm : Alarm) {
      
        try! realmManager.realm.write(){
            realmManager.realm.delete(alarm)
        }
    }
    
    //존재 여부
    public func isAlarm(id : Int) -> Bool {
        
        let result = realmManager.realm.objects(Alarm.self).filter("id = %d", id)
        if result.count > 0 {
            return true
        }
        return false
    }
    
    //선택 삭제
    public func delete(id : Int) {
        
        let result = realmManager.realm.objects(Alarm.self).filter("id = %d", id)
        if result.count > 0 {
      
            try! realmManager.realm.write() {
                realmManager.realm.delete(result)
            }
        }
    }
    
    //추가
    public func addAlarm(title : String, content : String) {
        
        let alarm = Alarm()
        alarm.id = getMaxId()
        alarm.title = title
        alarm.content = content
        alarm.writeDate = getData()
        
        try! realmManager.realm.write() {
            realmManager.realm.add(alarm)
        }
    }
    
    //추가
    public func addAlarm(alarm : Alarm) {
        
        let newalarm = alarm
        newalarm.id = getMaxId()
        newalarm.writeDate = getData()
        
        try! realmManager.realm.write() {
            realmManager.realm.add(newalarm)
        }
    }
    
    //업데이트
    public func updateAlarm(title : String, content : String, id : Int) {
        
        let result = realmManager.realm.objects(Alarm.self).filter("id = %d", id).first
        if result == nil {
            return
        }
        
        try! realmManager.realm.write() {
            
            result?.title = title
            result?.content = content
            result?.writeDate = getData()
        }
    }
    
    //전체 조회
    public func selectAll() -> [Alarm] {
        
        //let result : Results = realmManager.realm.objects(Alarm.self)
        
        let result : Results = realmManager.realm.objects(Alarm.self).sorted(byKeyPath: "id", ascending: false)
        
        var dic : [Alarm] = []
        
        for item in result {
            dic.append(item)
        }
        return dic
    }
    
    //선택 조회
    public func search(searchkey : String) -> [Alarm] {
        
        //let result : Results = realmManager.realm.objects(Alarm.self).filter("title contains %@", searchkey)
        
        let result : Results = realmManager.realm.objects(Alarm.self).filter("title contains %@", searchkey).sorted(byKeyPath: "id", ascending: false)
        
        var dic : [Alarm] = []
        
        for item in result {
            dic.append(item)
        }
        return dic
    }
}
