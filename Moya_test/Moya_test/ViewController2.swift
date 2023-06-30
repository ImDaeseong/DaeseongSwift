import UIKit
import Moya

class ViewController2: UIViewController {

    let provider = MoyaProvider<JsonApi>()

    override func viewDidLoad() {
        super.viewDidLoad()

        getbithumbTicker3()
    }
    
    @IBAction func button1_Click(_ sender: Any) {
        
        getbithumbTicker01()
    }
    
    
    @IBAction func button2_Click(_ sender: Any) {
        
        getbithumbTicker02()
    }
    
    
    @IBAction func button3_Click(_ sender: Any) {
        
        getbithumbTicker1()
    }
    
    
    @IBAction func button4_Click(_ sender: Any) {
        
        getbithumbTicker2()
    }
    
    
    @IBAction func button5_Click(_ sender: Any) {
        
        getbithumbTicker3()
    }
    
}

extension ViewController2 {
    
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
    
    func getbithumbTicker01() {
        
        provider.request(.getbithumbTicker01) { result in
            switch result {
            case let .success(response):
                
                //let request = response.request
                //print(request?.url)
                
                //let res = String(data: response.data, encoding: .utf8) ?? ""
                //print(res)
                
                do {
                    
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(btcdata.self, from: response.data)
                    print(json.status)
                    print(json.data)
                    print("opening_price: \(json.data.opening_price)")
                    print("closing_price: \(json.data.closing_price)")
                    print("min_price: \(json.data.min_price)")
                    print("max_price: \(json.data.max_price)")
                    print("units_traded: \(json.data.units_traded)")
                    print("date: \(json.data.date)")
                    
                } catch(let error) {
                    print(error.localizedDescription)
                }
                
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    
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
    
    func getbithumbTicker02(){
        
        provider.request(.getbithumbTicker02) { result in
            switch result {
            case let .success(response):
                
                //let request = response.request
                //print(request?.url)
                
                //let res = String(data: response.data, encoding: .utf8) ?? ""
                //print(res)
                
                do {
                    
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(orderBTC.self, from: response.data)
                    
                    print(json.status)
                    print(json.data.timestamp)
                    //print(json.data.bids)
                    
                    for item in json.data.bids {
                        print(item.price)
                    }
                    
                } catch(let error) {
                    print(error.localizedDescription)
                }
                
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    func getbithumbTicker1(){
        
        provider.request(.getbithumbTicker1) { result in
            switch result {
            case let .success(response):
                
                //let request = response.request
                //print(request?.url)
                
                let res = String(data: response.data, encoding: .utf8) ?? ""
                print(res)
                
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getbithumbTicker2(){
        
        provider.request(.getbithumbTicker2) { result in
            switch result {
            case let .success(response):
                
                //let request = response.request
                //print(request?.url)
                
                //let res = String(data: response.data, encoding: .utf8) ?? ""
                //print(res)
                
                do {
                    
                    let dic = try JSONSerialization.jsonObject(with: response.data, options: []) as! [String:Any]
                    
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
                    
                } catch(let error) {
                    print(error.localizedDescription)
                }
                
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getbithumbTicker3(){
        
        provider.request(.getbithumbTicker3) { result in
            switch result {
            case let .success(response):
                
                //let request = response.request
                //print(request?.url)
                
                //let res = String(data: response.data, encoding: .utf8) ?? ""
                //print(res)
                
                do {
                    
                    let dic = try JSONSerialization.jsonObject(with: response.data, options: []) as! [String:Any]
                    
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
                    
                } catch(let error) {
                    print(error.localizedDescription)
                }
                
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
}
