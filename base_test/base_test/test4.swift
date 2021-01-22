import Foundation

public func test4(){
    
    //let 배열
    let list = ["data1", "data2", "data3", "data4", "data5"]
    for item in list {
        print("item:\(item)")
    }
    
    
    //string 딕셔너리
    var dic = ["item1" : "data1", "item2" : "data2", "item3" : "data3"]
 
    //데이터 추가
    dic["item4"] = "data4"
    
    for (key, val) in dic {
        print("\(key):\(val)")
    }
    print("item1:\(dic["item1"]!)")
    print("item2:\(dic["item2"]!)")
    print("item3:\(dic["item3"]!)")
    print("item4:\(dic["item4"]!)")
    dic.removeAll()
    
    
    
    //any 딕셔너리
    let dicAny : Dictionary<String, Any> = ["item1" : "data1", "item2" : 100, "item3" : true]
    for (key, val) in dicAny {
        print("\(key):\(val)")
    }
    
    let data1 = dicAny["item1"] as? String
    print("item1:\(data1!)")
    
    let data2 = dicAny["item2"] as? Int
    print("item2:\(data2!)")
    
    let data3 = dicAny["item3"] as? Bool
    print("item3:\(data3!)")

    
    
    // 딕셔너리
    var dicI = Dictionary<Int, String>()
    dicI[0] = "data1"
    dicI[1] = "data2"
    dicI[2] = "data3"
    for (key, val) in dicI {
        print("\(key):\(val)")
    }
    dicI.removeAll()
    
    
    
    // 딕셔너리
    var dicS = Dictionary<String, Int>()
    dicS["data1"] = 1
    dicS["data2"] = 2
    dicS["data3"] = 3
    for (key, val) in dicS {
        print("\(key):\(val)")
    }
    dicS.removeAll()
    
}
