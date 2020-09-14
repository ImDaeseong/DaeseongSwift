import UIKit

class item3: UIViewController, UITableViewDataSource, XMLParserDelegate {
    
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
        
        //온라인 수집 가격 정보(품목정보)
        let defaulturl = String(format: "%@", "http://data.insight.go.kr:8080/openapi/service/PriceItemList/getPriceItemList?")
        let ServiceKey = String(format: "ServiceKey=%@", API_Key)
        let sUrl  = String(format: "%@%@", defaulturl, ServiceKey)
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! itemCell3
        
        var item = datalist[indexPath.row]
        
        cell.label1.text = item["rn"]
        cell.label2.text = item["ic"]
        cell.label3.text = item["in"]
        
        return cell
    }
}

