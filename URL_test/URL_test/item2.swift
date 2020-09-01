import UIKit
import Foundation

class item2: UIViewController {
    
    
    //https://api.bithumb.com/public/ticker/BTC
    struct btcdata : Codable {
        let status : String
        let data : itemdata
    }
    
    struct itemdata : Codable {
        let opening_price : String
        let closing_price : String
        let min_price : String
        let max_price : String
        let units_traded : String
        let date : String
    }
    
    
    //https://127.0.0.1/mobilegamelist.json
    struct gamelist : Codable {
        var id : String
        var name : String
        var packagename : String
    }
    
    
    
    //https://api.bithumb.com/public/orderbook/BTC
    struct orderBTC : Codable {
        let status : String
        let data : itemorder
    }
    
    struct itemorder : Codable {
        let timestamp : String
        let bids : [itembids]
    }
    
    struct itembids : Codable {
        let price : String
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn5_click(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        //getbithumbTicker0()
        //getbithumbTicker01()
        getbithumbTicker02()
    }

    @IBAction func btn2_click(_ sender: UIButton) {
        getbithumbTicker2()
    }
    
    @IBAction func btn3_click(_ sender: UIButton) {
        getbithumbTicker3()
    }
    
    func getbithumbTicker0(){
        
        let sUrl  = String(format: "%@", ".../mobilegamelist.json")
        /*
        [{"id":"1","name":"리니지2M","packagename":"com.ncsoft.lineage2m19"},
         {"id":"2","name":"라이즈 오브 킹덤즈","packagename":"com.lilithgames.rok.gpkr"},
         {"id":"3","name":"기적의 검","packagename":"com.qjzj4399kr.google"},
         {"id":"4","name":"V4","packagename":"com.nexon.v4kr"},
         {"id":"5","name":"블레이드&소울 레볼루션","packagename":"com.netmarble.bnsmkr"},
         {"id":"6","name":"클래시 로얄","packagename":"com.supercell.clashroyale"},
         {"id":"7","name":"달빛조각사","packagename":"com.kakaogames.moonlight"},
         {"id":"8","name":"세븐나이츠","packagename":"com.cjenm.sknights"},
         {"id":"9","name":"모두의마블","packagename":"com.cjenm.ModooMarbleKakao"},
         {"id":"10","name":"리니지2 레볼루션","packagename":"com.netmarble.lineageII"},
         {"id":"11","name":"검은사막 모바일","packagename":"com.pearlabyss.blackdesertm"},
         {"id":"12","name":"크롬","packagename":"com.android.chrome"},
         {"id":"13","name":"궁수의전설","packagename":"com.habby.archero"},
         {"id":"14","name":"브라우져","packagename":"com.android.browser"}]
        */
        
        let task = URLSession.shared.dataTask(with: URL(string: sUrl)!) {(Data, URLResponse, Error) in
            
            if let data = Data {
            
                do {
                    
                    let decoder = JSONDecoder()
                    let json = try decoder.decode([gamelist].self, from: data)
                    
                    for item in json {
                        print(item.id + " " + item.name + "  " + item.packagename)
                    }
                }catch{
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getbithumbTicker01(){
        
        let sUrl  = String(format: "%@", "https://api.bithumb.com/public/ticker/BTC")
        
        let task = URLSession.shared.dataTask(with: URL(string: sUrl)!) {(Data, URLResponse, Error) in
            
            if let data = Data {
                
                let decoder = JSONDecoder()
                
                do {
                    
                    if let json = try? decoder.decode(btcdata.self, from: data) {
                        
                        print(json.status)
                        print(json.data)
                        print("opening_price: \(json.data.opening_price)")
                        print("closing_price: \(json.data.closing_price)")
                        print("min_price: \(json.data.min_price)")
                        print("max_price: \(json.data.max_price)")
                        print("units_traded: \(json.data.units_traded)")
                        print("date: \(json.data.date)")
                    }
                }catch{
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getbithumbTicker02(){
        
        let sUrl  = String(format: "%@", "https://api.bithumb.com/public/orderbook/BTC")
        
        let task = URLSession.shared.dataTask(with: URL(string: sUrl)!) {(Data, URLResponse, Error) in
            
            if let data = Data {
                
                let decoder = JSONDecoder()
                
                do {
                    
                    if let json = try? decoder.decode(orderBTC.self, from: data) {
                        
                        print(json.status)
                        print(json.data.timestamp)
                        //print(json.data.bids)
                        
                        for item in json.data.bids {
                            print(item.price)
                        }
                    }
                    
                }catch{
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getbithumbTicker1(){
        
        let sUrl  = String(format: "%@", "https://api.bithumb.com/public/ticker/BTC")
        
        let task = URLSession.shared.dataTask(with: URL(string: sUrl)!) {(Data, URLResponse, Error) in
            //print(URLResponse)
            //print(Error)
            //print(Data)
            if Error == nil && Data != nil {
                if let json = String(data: Data!, encoding: .utf8) {
                    print( json)
                }
            }
        }
        task.resume()
    }
    
    func getbithumbTicker2(){
        
        let sUrl  = String(format: "%@", "https://api.bithumb.com/public/ticker/BTC")
        
        var request = URLRequest(url: URL(string: sUrl)!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters = [""]
        if let httpbody = try? JSONSerialization.data(withJSONObject: parameters, options: []){
            request.httpBody = httpbody
        }
        
        let task = URLSession.shared.dataTask(with: request) {(Data, URLResponse, Error) in
            
            guard let data = Data else {
                return
            }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
            
            if let dic = json {
                
                if let status = dic["status"] {
                    
                    if let val = dic["data"] as? [String:String] {
                        
                        let opening_price = val["opening_price"]!
                        print("opening_price: \(opening_price)")
                        
                        let closing_price = val["closing_price"]!
                        print("closing_price: \(closing_price)")
                        
                        let min_price = val["min_price"]!
                        print("min_price: \(min_price)")
                        
                        let max_price = val["max_price"]!
                        print("max_price: \(max_price)")
                        
                        let units_traded = val["units_traded"]!
                        print("units_traded: \(units_traded)")
                        
                        let date = val["date"]!
                        print("date: \(date)")
                    }
                }
            }
        }
        task.resume()
    }
    
    func getbithumbTicker3(){
        
        let sUrl  = String(format: "%@", "https://api.bithumb.com/public/ticker/BTC")
        
        let session = URLSession(configuration: .default)
        guard let url = URL(string: sUrl) else {
            return
        }
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (Data, URLResponse, Error) in
            
            if let res = URLResponse as? HTTPURLResponse, res.statusCode == 200 {
                
                guard let data = Data else {
                    return
                }
                
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                
                if let dic = json {
                    
                    if let status = dic["status"] {
                        
                        if let val = dic["data"] as? [String:String] {
                            
                            let opening_price = val["opening_price"]!
                            print("opening_price: \(opening_price)")
                            
                            let closing_price = val["closing_price"]!
                            print("closing_price: \(closing_price)")
                            
                            let min_price = val["min_price"]!
                            print("min_price: \(min_price)")
                            
                            let max_price = val["max_price"]!
                            print("max_price: \(max_price)")
                            
                            let units_traded = val["units_traded"]!
                            print("units_traded: \(units_traded)")
                            
                            let date = val["date"]!
                            print("date: \(date)")
                        }
                    }
                }
            }
        }
        task.resume()
    }
    
}



