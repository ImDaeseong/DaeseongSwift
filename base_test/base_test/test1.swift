import Foundation

public func test1(){
    
    //배열
    var list = ["data1", "data2", "data3", "data4", "data5"]
    print("list.count:\(list.count)")
    print("list:\(list)")
    
    //추가
    list.append("data6")
    print("list.count:\(list.count)")
    print("list:\(list)")

    
    //추가
    list += ["data6"]
    print("list.count:\(list.count)")
    print("list:\(list)")
    
    //수정
    list[list.count - 1] = "data7"
    print("list.count:\(list.count)")
    print("list:\(list)")
}
