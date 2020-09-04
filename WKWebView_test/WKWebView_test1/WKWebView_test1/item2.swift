import UIKit
import WebKit

class item2: UIViewController {
    
    @IBOutlet weak var toolbar1: UIToolbar!
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var label1: UILabel!
    
    var webview1: WKWebView!
    
    override func loadView() {
        super.loadView()
        
        //print("loadView")
        
        webview1 = WKWebView()
        webview1.frame = CGRect(x: 0,  y: 0, width : view.frame.size.width,  height : view.frame.size.height )
        view1.addSubview(webview1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("viewDidLoad")
        
        let url = URL(string: "https://m.naver.com")!
        webview1.load(URLRequest(url: url))
        webview1.allowsBackForwardNavigationGestures = true//webview 앞으로가기, 뒤로가기 제스처 사용 가능
    }
    
    @IBAction func back_click(_ sender: Any) {
        webview1.goBack()
    }
    
    @IBAction func go_click(_ sender: Any) {
        webview1.goForward()
    }
}
