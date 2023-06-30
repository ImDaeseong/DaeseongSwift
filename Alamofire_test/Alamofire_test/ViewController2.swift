import UIKit
import Alamofire

class ViewController2: UIViewController {

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
        
        let Url = "https://api.bithumb.com/public/ticker/BTC"
        
        AF.request(Url, method: .get, parameters: nil).responseData { response in
            switch response.result {
            case .success(let data):
                
                do {
                    
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(btcdata.self, from: data)
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
                
            case .failure(let error):
                print(error)
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
        
        let Url = "https://api.bithumb.com/public/orderbook/BTC"
        
        AF.request(Url, method: .get, parameters: nil).responseData { response in
            switch response.result {
            case .success(let data):
                
                do {
                    
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(orderBTC.self, from: data)
                    
                    print(json.status)
                    print(json.data.timestamp)
                    //print(json.data.bids)
                    
                    for item in json.data.bids {
                        print(item.price)
                    }
                    
                } catch(let error) {
                    print(error.localizedDescription)
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func getbithumbTicker1(){
        
        let Url = "https://api.bithumb.com/public/ticker/BTC"
        
        AF.request(Url, method: .get, parameters: nil).responseData { response in
            switch response.result {
            case .success(let data):
                
                let res = String(data: data, encoding: .utf8) ?? ""
                print(res)
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func getbithumbTicker2(){
        
        let Url = "https://api.bithumb.com/public/ticker/BTC"
        
        AF.request(Url, method: .get, parameters: nil).responseData { response in
            switch response.result {
            case .success(let data):
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        
                        if let status = json["status"] as? String, status == "0000" {
                            
                            if let data = json["data"] as? [String: Any] {
                                
                                if let openingPrice = data["opening_price"] as? String {
                                    print("Opening Price: \(openingPrice)")
                                }
                                
                                if let closingPrice = data["closing_price"] as? String {
                                    print("Closing Price: \(closingPrice)")
                                }
                                
                                if let minPrice = data["min_price"] as? String {
                                    print("Minimum Price: \(minPrice)")
                                }
                                
                                if let maxPrice = data["max_price"] as? String {
                                    print("Maximum Price: \(maxPrice)")
                                }
                                
                                if let unitsTraded = data["units_traded"] as? String {
                                    print("Units Traded: \(unitsTraded)")
                                }
                                
                                if let date = data["date"] as? String {
                                    print("Date: \(date)")
                                }
                            }
                        }
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func getbithumbTicker3() {
        
        let Url = "https://api.bithumb.com/public/ticker/BTC"
        
        AF.request(Url, method: .get, parameters: nil).responseData { response in
            switch response.result {
            case .success(let data):
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        
                        if let status = json["status"] as? String, status == "0000" {
                            
                            if let data = json["data"] as? [String: Any] {
                                
                                if let openingPrice = data["opening_price"] as? String {
                                    print("Opening Price: \(openingPrice)")
                                }
                                
                                if let closingPrice = data["closing_price"] as? String {
                                    print("Closing Price: \(closingPrice)")
                                }
                                
                                if let minPrice = data["min_price"] as? String {
                                    print("Minimum Price: \(minPrice)")
                                }
                                
                                if let maxPrice = data["max_price"] as? String {
                                    print("Maximum Price: \(maxPrice)")
                                }
                                
                                if let unitsTraded = data["units_traded"] as? String {
                                    print("Units Traded: \(unitsTraded)")
                                }
                                
                                if let date = data["date"] as? String {
                                    print("Date: \(date)")
                                }
                            }
                        }
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
