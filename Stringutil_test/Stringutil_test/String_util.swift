
import Foundation

public func getExt(sInput : String) -> String? {
    
    if sInput == "" {
        return nil
    }
    
    if let lastindex = sInput.lastIndex(of: ".") {
        
        let sResult : String =  String(sInput[ sInput.index( after: lastindex) ..< sInput.endIndex])
        
        return sResult
    }
    
    return nil
}
 
public func getName(sInput : String) -> String? {
    
    if sInput == "" {
        return nil
    }
    
    if let lastindex = sInput.lastIndex(of: "/") {
        let sResult = String( sInput[ sInput.index( after: lastindex) ..< sInput.endIndex] )
        return sResult
    }
    
    return nil
}

public func getUpper(sInput : String) -> String? {
    
    if sInput == "" {
        return nil
    }
    
    return sInput.uppercased()
}

public func getLower(sInput : String) -> String? {
    
    if sInput == "" {
        return nil
    }
    
    return sInput.lowercased()
}

public func getSplitFirst(sInput : String, sType : Character) -> String? {
    
    if sInput == "" {
        return nil
    }
    
    let sResult = sInput.split(separator: sType)
    return String(sResult.first!)
}

public func getSplitFirstA(sInput : String, sType : String) -> String? {
    
    if sInput == "" {
        return nil
    }
    
    let sResult = sInput.components(separatedBy: sType)
    if let first = sResult.first {
        return first
    }
    return nil
}

public func getSplitLast(sInput : String, sType : Character) -> String? {
    
    if sInput == "" {
        return nil
    }
    
    let sResult = sInput.split(separator: sType)
    
    return String(sResult.last!)
}

public func getSplitLastA(sInput : String, sType : String) -> String? {
    
    if sInput == "" {
        return nil
    }
    
    let sResult = sInput.components(separatedBy: sType)
    if let last = sResult.last {
        return last
    }
    return nil
}

public func getSplit(sInput : String, sType : Character) -> [String]? {
    
    if sInput == "" {
        return nil
    }
    
    return sInput.split(separator : sType).map(String.init)
}

public func getSubString(sInput : String, sStart : String, sEnd : String) -> String? {
    
    if sInput == "" {
        return nil
    }
    
    var sResult : String = sInput
    
    if let index = sResult.range(of: sStart) {
        
        sResult.removeSubrange(sResult.startIndex ..< index.upperBound)
    }
    
    if let index = sResult.range(of: sEnd) {
        
        sResult.removeSubrange(index.lowerBound ..< sResult.endIndex)
    }
    
    return sResult
}

public func getLeft(sInput : String, length : Int) ->String? {
    
    if sInput == "" {
        return nil
    }
    
    if length <= sInput.count {
        
        /*
        //첫번째 방법
        let nStart = sInput.startIndex
        let nEnd = sInput.index(sInput.endIndex, offsetBy: length - sInput.count)
        let sResult = sInput[nStart ..< nEnd]
        return String(sResult)
        */
        
        /*
        //두번째 방법
        let index = sInput.index(sInput.startIndex, offsetBy: length)
        let sResult = sInput[..<index]
        return String(sResult)
        */
        
        //세번째 방법
        let sResult = sInput.prefix(length)
        return String(sResult)
    }
    return nil
}

public func getRight(sInput : String, length : Int) ->String? {
    
    if sInput == "" {
        return nil
    }
    
    if length <= sInput.count {
        
        /*
        //첫번째 방법
        let nStart = sInput.index(sInput.startIndex, offsetBy: sInput.count - length)
        let nEnd = sInput.endIndex
        let sResult = sInput[nStart ..< nEnd]
        return String(sResult)
        */
       
        /*
        //두번째 방법
        let index = sInput.index(sInput.endIndex, offsetBy: -(length))
        let sResult = sInput[index...]
        return String(sResult)
        */
        
        //세번째 방법
        let sResult = sInput.suffix(length)
        return String(sResult)
    }
    return nil
}

public func getReplace(sInput : String, sFind : String, sReplace : String) -> String? {
    
    if sInput == "" {
        return nil
    }
    
    let sResult = sInput.replacingOccurrences(of: sFind, with: sReplace)
    return sResult
}

public func getTrim(sInput : String) -> String? {
    
    if sInput == "" {
        return nil
    }
    
    let sResult = sInput.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    
    return sResult
}

public func getFileSize(size : Double) -> String? {
    
    var sResult : String?
    
    if size < 1024 {
        
        sResult = String(format: "%d", arguments: [Int(size)])
        
    } else if size < (1024 * 1024) {
        
        let float = (size/1024)
        sResult = String(format: "%.1fKB", arguments: [float])
        
    } else if size < (1024 * 1024 * 1024) {
        
        let float = (size/(1024*1024))
        sResult = String(format: "%.1fMB", arguments: [float])
        
    } else {
    
        let float = (size/(1024*1024*1024))
        sResult = String(format: "%.1fGB", arguments: [float])
    }
    
    return sResult
}

public func getTime() ->String {
    
    let format1 = "yyyy-MM-dd HH:mm:ss"
    //let format2 = "yyyy-MM-dd"
    //let format3 = "yyyy년 MM월 dd일 HH시 mm분 ss초"
    
    let dataFormat = DateFormatter()
    dataFormat.locale = Locale(identifier: "ko")
    dataFormat.dateFormat = format1
    return dataFormat.string(from: Date())
}

public func getDateSubtract(from : Date, to : Date) -> Double {
    
    var interval: Double!
    
    interval = to.timeIntervalSince(from)
    let days = (interval / 86400)
    return floor(days)
}

public func getTimeSubtract(from : Date, to : Date) -> Double {
    
    let hours = floor( to.timeIntervalSince(from) / 60 / 60)
    let minute = floor( to.timeIntervalSince(from) - (hours * 60 * 60) / 60)
    
    return hours
}
