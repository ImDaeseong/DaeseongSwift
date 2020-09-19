import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class item1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        loadData()
    }
    
    func loadData(){
        
        SVProgressHUD.show()
        
        Alamofire.request("https://api.bithumb.com/public/ticker/BTC").responseJSON { (resData) -> Void in
            if( (resData.result.value) != nil ){
                
                let jsonData = JSON(resData.result.value!)
                //print(jsonData)
                
                if let dataArray = jsonData["data"].dictionary {
                    //print(dataArray)
                    print(dataArray["min_price"]!)
                    print(dataArray["units_traded_24H"]!)
                    print(dataArray["fluctate_24H"]!)
                    print(dataArray["max_price"]!)
                    print(dataArray["prev_closing_price"]!)
                    print(dataArray["closing_price"]!)
                    print(dataArray["acc_trade_value"]!)
                    print(dataArray["fluctate_rate_24H"]!)
                    print(dataArray["date"]!)
                    print(dataArray["acc_trade_value_24H"]!)
                    print(dataArray["opening_price"]!)
                    print(dataArray["units_traded"]!)
                }
                
            }
        }
        
        SVProgressHUD.dismiss(withDelay: 1)
    }
}


