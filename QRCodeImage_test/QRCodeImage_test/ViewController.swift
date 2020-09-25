
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageview1: UIImageView!
    @IBOutlet weak var imageview2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imageview1.image = getQRCodeImage("1234567890")
        //imageview1.image = getQRCodeImage("https://m.naver.com")
        //imageview1.image = getQRCodeImage("https://m.naver.com 1234567890")
        //imageview1.image = getQRCodeImage("테스트")
        imageview1.image = getQRCodeImage("테스트 https://m.naver.com 1234567890")
        
        //imageview2.image = getQRCodeImageUTF("1234567890")
        //imageview2.image = getQRCodeImageUTF("https://m.naver.com")
        //imageview2.image = getQRCodeImageUTF("https://m.naver.com 1234567890")
        //imageview2.image = getQRCodeImageUTF("테스트")
        imageview2.image = getQRCodeImageUTF("테스트 https://m.naver.com 1234567890")
    }

    func getQRCodeImage(_ sText : String) -> UIImage? {
        
        let data = sText.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
    
    func getQRCodeImageUTF(_ sText : String) -> UIImage? {
        
         let data = sText.data(using: String.Encoding.utf8)
         
         if let filter = CIFilter(name: "CIQRCodeGenerator") {
            
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
         
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
         }
         return nil
    }
}

