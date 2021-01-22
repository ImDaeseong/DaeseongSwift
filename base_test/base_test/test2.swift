import Foundation

public func test2(){
    
    var data1 = 10
    let result1 = "10+" + String(data1)
    print("result1:\(result1)")
    
    var data2 : String? = "data2"
    print("result2:\(data2)")
    print("result2:\(data2!)")
    
    data2 = nil
    print("result2:\(data2)")
}
