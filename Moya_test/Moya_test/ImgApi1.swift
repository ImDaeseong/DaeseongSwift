import Foundation
import Moya

enum ImgApi1 {
    case downloadImg1(sUrl : String)
    case downloadImg2(sUrl : String)
}

extension ImgApi1 : TargetType {
    
    var baseURL: URL {
        return URL(string: "https://cdn.pixabay.com")!
    }
    
    var path : String {
        switch self {
        case .downloadImg1(_):
            return "photo/2015/07/14/18/14/school-845196_960_720.png"
            
        case .downloadImg2(_):
            return "photo/2016/03/23/08/34/woman-1274361_960_720.jpg"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .downloadImg1, .downloadImg2:
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
        return nil
    }
}
