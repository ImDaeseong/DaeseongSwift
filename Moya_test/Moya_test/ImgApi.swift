import Foundation
import Moya

let ImgProvider = MoyaProvider<ImgApi>()

enum ImgApi {
    case downloadImg(sUrl : String)
}

extension ImgApi : TargetType {
    
    var baseURL: URL {
        return URL(string: "https://cdn.pixabay.com")!
    }
    
    var path : String {
        switch self {
        case .downloadImg(let sUrl):
            return sUrl
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}
