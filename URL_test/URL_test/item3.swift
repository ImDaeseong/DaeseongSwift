import UIKit

class item3: UIViewController, XMLParserDelegate {
    
    let API_Key = "%2FSWbuoncrZtSM3DaBUA4PJVxqJMFKs0Eu%2F%2FzgFQf8dvVjzIi8ESOjmRaQtAkLKoQUS3S%2BZy%2FwLwR08%2BCT9BWuA%3D%3D"
    
    var parser = XMLParser()
    var bConnect : Bool = false
    var currentelement : String = ""
    var xmlvalue = ""
    
    var busRouteId : [String] = []
    var busRouteNm : [String] = []
    var corpNm : [String] = []
    var edStationNm : [String] = []
    var firstBusTm : [String] = []
    var firstLowTm : [String] = []
    var lastBusTm : [String] = []
    var lastBusYn : [String] = []
    var lastLowTm : [String] = []
    var length : [String] = []
    var routeType : [String] = []
    var stStationNm : [String] = []
    var term : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getBusRouteListxml()
    }
    
    @IBAction func btn2_click(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func getBusRouteListxml(){
        
        let defaulturl = String(format: "%@", "http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?")
        let busRouteId = String(format: "strSrch=%d", 3)
        let ServiceKey = String(format: "&ServiceKey=%@", API_Key)
        let sUrl  = String(format: "%@%@%@", defaulturl, busRouteId, ServiceKey)
        //print(sUrl)
        
        let parser = XMLParser(contentsOf: (URL(string: sUrl))!)!
        parser.delegate = self
        parser.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentelement = elementName
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if (currentelement == "headerCd") {
            
            if( string == "0" ){
                bConnect = true//정상적으로 처리되었는지 확인
            } else {
                bConnect = false
            }
        }
        xmlvalue = xmlvalue.appending(string)
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if currentelement == "busRouteId" {
            busRouteId.append(xmlvalue)
        } else if currentelement == "busRouteNm" {
            busRouteNm.append(xmlvalue)
        } else if currentelement == "corpNm" {
            corpNm.append(xmlvalue)
        } else if currentelement == "edStationNm" {
            edStationNm.append(xmlvalue)
        } else if currentelement == "firstBusTm" {
            firstBusTm.append(xmlvalue)
        } else if currentelement == "firstLowTm" {
            firstLowTm.append(xmlvalue)
        } else if currentelement == "lastBusTm" {
            lastBusTm.append(xmlvalue)
        } else if currentelement == "lastBusYn" {
            lastBusYn.append(xmlvalue)
        } else if currentelement == "lastLowTm" {
            lastLowTm.append(xmlvalue)
        } else if currentelement == "length" {
            length.append(xmlvalue)
        } else if currentelement == "routeType" {
            routeType.append(xmlvalue)
        } else if currentelement == "stStationNm" {
            stStationNm.append(xmlvalue)
        } else if currentelement == "term" {
            term.append(xmlvalue)
        }
        
        currentelement =  ""
        xmlvalue = ""
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        
        //xml 데이터 확인
        print("busRouteId.count:" + String(busRouteId.count))
        //print("busRouteNm.count:" + String(busRouteNm.count))
        //print("corpNm.count:" + String(corpNm.count))
        //print("edStationNm.count:" + String(edStationNm.count))
        //print("firstBusTm.count:" + String(firstBusTm.count))
        //print("firstLowTm.count:" + String(firstLowTm.count))
        //print("lastBusTm.count:" + String(lastBusTm.count))
        //print("lastBusYn.count:" + String(lastBusYn.count))
        //print("lastLowTm.count:" + String(lastLowTm.count))
        //print("length.count:" + String(length.count))
        //print("routeType.count:" + String(routeType.count))
        //print("stStationNm.count:" + String(stStationNm.count))
        //print("term.count:" + String(term.count))
        
        for item in busRouteId {
            print(item)
        }
        
        for i in 0..<busRouteId.count{
            print(busRouteId[i])
            print(busRouteNm[i])
            print(corpNm[i])
            print(edStationNm[i])
            print(firstBusTm[i])
            print(firstLowTm[i])
            print(lastBusTm[i])
            print(lastBusYn[i])
            print(lastLowTm[i])
            print(length[i])
            print(routeType[i])
            print(stStationNm[i])
            print(term[i])
        }
        
        //데이터 초기화
        busRouteId  = []
        busRouteNm  = []
        corpNm  = []
        edStationNm  = []
        firstBusTm  = []
        firstLowTm  = []
        lastBusTm  = []
        lastBusYn  = []
        lastLowTm  = []
        length  = []
        routeType  = []
        stStationNm  = []
        term  = []
    }
    
}

