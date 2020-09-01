import UIKit

class item4: UIViewController {
    
    let API_Key = "%2FSWbuoncrZtSM3DaBUA4PJVxqJMFKs0Eu%2F%2FzgFQf8dvVjzIi8ESOjmRaQtAkLKoQUS3S%2BZy%2FwLwR08%2BCT9BWuA%3D%3D"
    
    struct CtprvnMesureSidoLIst : Codable {
        
        struct List : Codable {
            let dataTime : String
            let cityName : String
            let so2Value : String
            let coValue : String
            let o3Value : String
            let no2Value : String
            let pm10Value : String
            let pm25Value : String
        }
        
        let list : [List]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCtprvnMesureSidoLIst()
    }
    
    @IBAction func btn2_click(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func getCtprvnMesureSidoLIst(){
        
        let defaulturl = String(format: "%@","http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst?")
        let numOfRows = String(format: "numOfRows=%d", 10)
        let pageNo = String(format: "&pageNo=%d", 1)
        let sidoName = String(format: "&sidoName=%@", getKoreanEncode("서울"))   //시도 이름 (서울, 부산, 대구, 인천, 광주, 대전, 울산, 경기, 강원, 충북, 충남, 전북, 전남, 경북, 경남, 제주, 세종)
        let searchCondition = String(format: "&searchCondition=%@", "DAILY") //요청 데이터기간 (시간 : HOUR, 하루 : DAILY)
        let ServiceKey = String(format: "&ServiceKey=%@&_returnType=json", API_Key)
        let sUrl = String(format: "%@%@%@%@%@%@", defaulturl, numOfRows, pageNo, sidoName, searchCondition, ServiceKey)
        //print(sUrl)
        
        let task = URLSession.shared.dataTask(with: URL(string: sUrl)!) {(Data, URLResponse, Error) in
            
            if let res = URLResponse as? HTTPURLResponse, res.statusCode == 200 {
                
                guard let data = Data else {
                    return
                }
                
                do {
                    
                    let decoder = JSONDecoder()
                    let sidoList = try decoder.decode(CtprvnMesureSidoLIst.self, from: data)
                    
                    print("개수: \(sidoList.list.count)")
                    
                    for item in sidoList.list {
                        print(item.dataTime)
                        print(item.cityName)
                        print(item.so2Value)
                        print(item.coValue)
                        print(item.o3Value)
                        print(item.no2Value)
                        print(item.pm10Value)
                        print(item.pm25Value)
                    }
                    
                } catch{
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getKoreanEncode(_ value : String) -> String {
        return value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? value
    }
}

