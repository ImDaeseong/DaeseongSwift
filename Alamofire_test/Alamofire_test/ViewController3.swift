import UIKit
import Alamofire
import SWXMLHash

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        loadXml()
    }

}


extension ViewController3 {
    
    func loadXml() {
        
        let Url = "http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList"
        
        let parameters: [String: Any] = [
            "serviceKey": "/SWbuoncrZtSM3DaBUA4PJVxqJMFKs0Eu//zgFQf8dvVjzIi8ESOjmRaQtAkLKoQUS3S+Zy/wLwR08+CT9BWuA==",
            "strSrch": 3
        ]
        
        AF.request(Url, method: .get, parameters: parameters).responseData { response in
            switch response.result {
            case .success(let data):
                
                //let request = response.request
                //print(request?.url)
                
                //let res = String(data: data, encoding: .utf8) ?? ""
                //print(res)
                
                do {
                    
                    let xml = try XMLHash.parse(data)
                    
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
                
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
}
