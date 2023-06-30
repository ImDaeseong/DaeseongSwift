import Foundation
import Moya

enum BusService {
    case getBusRouteList(strSrch: String)
}

extension BusService: TargetType {
    
    var baseURL: URL {
        return URL(string: "http://ws.bus.go.kr/api/rest/busRouteInfo/")!
    }
    
    var path: String {
        switch self {
        case .getBusRouteList:
            return "getBusRouteList"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .getBusRouteList(strSrch):
            
            let parameters: [String: Any] = [
                "serviceKey": "/SWbuoncrZtSM3DaBUA4PJVxqJMFKs0Eu//zgFQf8dvVjzIi8ESOjmRaQtAkLKoQUS3S+Zy/wLwR08+CT9BWuA==",
                "strSrch": strSrch
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}

