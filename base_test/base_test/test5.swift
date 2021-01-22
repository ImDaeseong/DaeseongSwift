import Foundation

enum itemType {
    case item1, item2, item3
    
    func getItem() -> String {
        
        switch self {
        case .item1:
            return "item1"
       
        case .item2:
            return "item2"
            
        case .item3:
            return "item3"
        }
    }
    
    func getItem() -> Int {
        
        switch self {
        case .item1:
            return 1
       
        case .item2:
            return 2
            
        case .item3:
            return 3
        }
    }
}

public func test5(){
    
    var item1 : Int = itemType.item1.getItem()
    var item2 : String = itemType.item1.getItem()
    print("item1:\(item1)")
    print("item2:\(item2)")
}
