import UIKit

class item1: UIViewController, UITableViewDataSource, XMLParserDelegate {
    
    let API_Key = "%2FSWbuoncrZtSM3DaBUA4PJVxqJMFKs0Eu%2F%2FzgFQf8dvVjzIi8ESOjmRaQtAkLKoQUS3S%2BZy%2FwLwR08%2BCT9BWuA%3D%3D"
    
    var currentelement : String = ""
    var bConnect : Bool = false
    
    var datalist = [[String:String]]()
    var detaildata = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData(){
        
        let sparam = "서울"
        let scity = sparam.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        //시군구별 실시간 평균정보 조회
        let defaulturl = String(format: "%@", "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst?")
        let ServiceKey = String(format: "ServiceKey=%@", API_Key)
        let numOfRows = String(format: "&numOfRows=10&pageNo=1")
        let sidoName = String(format: "&sidoName=%@", scity)
        let searchCondition = String(format: "&searchCondition=DAILY&")
        let sUrl  = String(format: "%@%@%@%@%@", defaulturl, ServiceKey, numOfRows, sidoName, searchCondition)
        //print(sUrl)
        
        guard let baseURL = URL(string: sUrl) else {
            return
        }
        
        guard let parser = XMLParser(contentsOf: baseURL) else {
            return
        }
        
        parser.delegate = self
        
        if !parser.parse() {
        }
    }
    
    //태그 시작
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentelement = elementName
        bConnect = true
    }
    
    //태그 사이의 문자열
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        
        if ( currentelement != "response" &&
             currentelement != "header" &&
             currentelement != "resultCode" &&
             currentelement != "resultMsg" &&
             currentelement != "body" &&
             currentelement != "items" &&
             currentelement != "item" &&
             currentelement != "numOfRows" &&
             currentelement != "pageNo" &&
             currentelement != "totalCount" &&
             bConnect == true){
            
             detaildata[currentelement] = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    //태그 끝
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "item" {
            datalist += [detaildata]
        }
        
        bConnect = false
    }
    
    //에러시
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        bConnect = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! itemCell
        
        var item = datalist[indexPath.row]
        
        cell.label1.text = item["dataTime"]
        cell.label2.text = item["cityName"]
        cell.label3.text = item["so2Value"]
        
        return cell
    }
}
