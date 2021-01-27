import RealmSwift

public class Alarm : Object {
    
    @objc dynamic var id : Int = 0
    @objc dynamic var title : String = ""
    @objc dynamic var content : String = ""
    @objc dynamic var writeDate : String = ""
}
