import Foundation

class A1 {
    init() {
        
    }
    
    func getData() -> Int {
        
        return 0
    }
    
    func getData() -> String {
        
        return String("")
    }
}

class A2 : A1 {
    
    var nVal : Int
    var nData : Int {
        get {
            return nVal
        }
        set {
            nVal = newValue
        }
    }
    
    var sVal : String
    var sData : String {
        get {
            return sVal
        }
        set {
            sVal = newValue
        }
    }
    
    init(nVal : Int, sVal : String){
       
        self.nVal = nVal
        self.sVal = sVal
        
        super.init()
    }
    
    override func getData() -> Int {
        return nVal
    }
    
    override func getData() -> String {
        return sVal
    }
}

public func test3(){
    
    //클래스 선언시 입력값 출력
    var obj = A2(nVal: 10, sVal: "str10")
    
    let val1 : Int = obj.getData()
    let val2 : String = obj.getData()
    print("val1:\(val1)")
    print("val2:\(val2)")
    
    
    //데이터 변경후 출력
    obj.nVal = 100
    obj.sVal = "str100"
    
    let val3 : Int = obj.getData()
    let val4 : String = obj.getData()
    print("val3:\(val3)")
    print("val4:\(val4)")
}
