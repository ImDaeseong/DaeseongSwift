import UIKit
import WebKit

class item1: UIViewController {
    
    @IBOutlet weak var toolbar1: UIToolbar!
    
    var webview1: WKWebView!
    
    override func loadView() {
        super.loadView()
        
        //print("loadView")
        
        webview1 = WKWebView()
        webview1.frame = CGRect(x: 0,  y: (toolbar1.frame.size.height*2), width : view.frame.size.width,  height : view.frame.size.height - (toolbar1.frame.size.height*2) )
        self.view.addSubview(webview1)
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
