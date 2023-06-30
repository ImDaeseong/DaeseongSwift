import Foundation
import Moya

enum JsonApi {
    case getbithumbTicker01
    case getbithumbTicker02
    case getbithumbTicker1
    case getbithumbTicker2
    case getbithumbTicker3
}

extension JsonApi : TargetType {
    
    var baseURL: URL {
        return URL(string: "https://api.bithumb.com")!
    }
    
    var path : String {
        switch self {
        case .getbithumbTicker01:
            return "/public/ticker/BTC"
        case .getbithumbTicker02:
            return "/public/orderbook/BTC"
        case .getbithumbTicker1:
            return "public/ticker/BTC"
        case .getbithumbTicker2:
            return "/public/ticker/BTC"
        case .getbithumbTicker3:
            return "/public/ticker/BTC"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getbithumbTicker01:
            return .get
        case .getbithumbTicker02:
            return .get
        case .getbithumbTicker1:
            return .get
        case .getbithumbTicker2:
            return .get
        case .getbithumbTicker3:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        
        switch self {
        default:
            return ["Content-Type" : "application/json"]
        }
    }
}
