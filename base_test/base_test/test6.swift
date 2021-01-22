import Foundation

private func func1(sVal : String, nVal : Int) -> String {
    
    return "\(sVal)\(nVal)"
}

private func func2(nAry : Int...) -> Int {
    
    var nAdd : Int = 0
    for i in nAry {
        nAdd += i
        //print(i)
    }
    return nAdd
}

private func func3(sAry : String...) -> String {
    
    var sAdd : String = ""
    for i in sAry {
        sAdd += i
        //print(i)
    }
    return sAdd
}

private func func4(sAry : String...) -> [String] {
    
    var sAdd : [String] = []
    
    for i in sAry {
        sAdd.append(i)
    }
    return sAdd
}

private func func5() -> ((Int) -> Int) {
    
    func calc(nVal : Int) -> Int {
        
        return (nVal * 10)
    }
    
    return calc
}

private func func6() -> ((String) -> String) {
    
    func str(sVal : String) -> String {
        
        return "func6 함수 호출 테스트 -  \(sVal)"
    }
    
    return str
}

private func func7() -> (String, String) {
    
    return ("item1", "item2")
}


private func func8() -> (Int, Int) {
    
    return (10, 100)
}

public func test6(){
    
    let item1 = func1(sVal: "item1-", nVal: 10)
    print("item1:\(item1)")
    
    
    let item2 = func2(nAry: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    print("item2:\(item2)")
    
    
    let item3 = func3(sAry: "1", "2", "3", "4", "5", "6", "7", "8", "9", "10")
    print("item3:\(item3)")
    
    
    let item4 = func4(sAry: "1", "2", "3", "4", "5", "6", "7", "8", "9", "10")
    print("item4:\(item4)")
    for i in item4 {
        print("i:\(i)")
    }
    
    
    var item5 = func5()
    let calc = item5(1)
    print("calc:\(calc)")
    
    
    var item6 = func6()
    let str = item6("item1")
    print("str:\(str)")
    
    
    let item7 = func7()
    print("item7:\(item7)")
    print("item7-1:\(item7.0)")
    print("item7-2:\(item7.1)")
    
    
    let item8 = func8()
    print("item8:\(item8)")
    print("item8-1:\(item8.0)")
    print("item8-2:\(item8.1)")
    
}
