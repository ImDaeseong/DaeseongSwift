import UIKit
import Foundation

class DownloadUrl {
    
    static func imgDownload(imageview : UIImageView, url : String){
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { (Data, URLResponse, Error) in
            
            if Error == nil && Data != nil {
                
                let image = UIImage(data: Data!)
                DispatchQueue.main.async {
                    imageview.image = image
                }
            }
        }
        task.resume()
    }
}
