import UIKit
import Moya
import SWXMLHash

class ViewController3: UIViewController {

    let provider = MoyaProvider<BusService>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadXml()
    }
  
}

extension ViewController3 {
    
    func loadXml() {
        
        provider.request(.getBusRouteList(strSrch: "3")) { result in
            switch result {
            case let .success(response):
                
                //let request = response.request
                //print(request?.url)
                
                //let res = String(data: response.data, encoding: .utf8) ?? ""
                //print(res)
                
                do {
                    
                    let xml = try XMLHash.parse(response.data)
                    
                    let headerMsg = xml["ServiceResult"]["msgHeader"]["headerMsg"].element?.text ?? ""
                    //print(headerMsg)
                    
                    let msgBody = xml["ServiceResult"]["msgBody"]["itemList"]
                    for item in msgBody.all {
                        
                        let busRouteAbrv = item["busRouteAbrv"].element?.text
                        let busRouteId = item["busRouteId"].element?.text
                        let busRouteNm = item["busRouteNm"].element?.text
                        let corpNm = item["corpNm"].element?.text
                        let edStationNm = item["edStationNm"].element?.text
                        let firstBusTm = item["firstBusTm"].element?.text
                        let lastBusTm = item["lastBusTm"].element?.text
                        let length = item["length"].element?.text
                        let routeType = item["routeType"].element?.text
                        let stStationNm = item["stStationNm"].element?.text
                        let term = item["term"].element?.text
                                
                        print("Bus Route: \(busRouteNm ?? "")")
                        print("Bus Route ID: \(busRouteId ?? "")")
                        print("Starting Station: \(stStationNm ?? "")")
                        print("Ending Station: \(edStationNm ?? "")")
                        print("First Bus Time: \(firstBusTm ?? "")")
                        print("Last Bus Time: \(lastBusTm ?? "")")
                        print("Length: \(length ?? "")")
                        print("Route Type: \(routeType ?? "")")
                        print("Term: \(term ?? "")")
                    }
                    
                } catch {
                    print("error")
                }
                
                
            case let .failure(error):
                // 요청 실패한 경우 처리
                print(error)
            }
        }
    }
    
}
