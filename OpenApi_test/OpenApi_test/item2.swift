import UIKit

class item2: UIViewController, UITableViewDataSource, XMLParserDelegate {
    
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
        
        //노선번호에 해당하는 노선 목록 조회
        let defaulturl = String(format: "%@", "http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?")
        let ServiceKey = String(format: "ServiceKey=%@", API_Key)
        let strSrch = String(format: "&strSrch=3&")
        let sUrl  = String(format: "%@%@%@", defaulturl, ServiceKey, strSrch)
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
        
        
        if ( currentelement != "ServiceResult" &&
             currentelement != "comMsgHeader" &&
             currentelement != "msgHeader" &&
             currentelement != "headerCd" &&
             currentelement != "headerMsg" &&
             currentelement != "itemCount" &&
             currentelement != "msgBody" &&
             currentelement != "itemList" &&
             bConnect == true){
            
             detaildata[currentelement] = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    //태그 끝
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "itemList" {
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! itemCell2
        
        var item = datalist[indexPath.row]
        
        cell.label1.text = item["busRouteId"]
        cell.label2.text = item["busRouteNm"]
        cell.label3.text = item["corpNm"]
        cell.label4.text = item["edStationNm"]
        cell.label5.text = item["firstBusTm"]
        cell.label6.text = item["firstLowTm"]
        cell.label7.text = item["lastBusTm"]
        cell.label8.text = item["lastBusYn"]
        cell.label9.text = item["lastLowTm"]
        cell.label10.text = item["length"]
        cell.label11.text = item["routeType"]
        cell.label12.text = item["stStationNm"]
        cell.label13.text = item["term"]
        
        return cell
    }
}
