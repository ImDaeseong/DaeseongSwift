
import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var textfield1: UITextField!
    
    @IBOutlet weak var webview1: WKWebView!
    
    override func loadView() {
        super.loadView()
        
        webview1.uiDelegate = self
    }
    
    private func loadWebPage(_ url : String){
        let myurl = URL(string: url)
        let myrequest = URLRequest(url: myurl!)
        webview1.load(myrequest)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview1.allowsBackForwardNavigationGestures = true
        
        loadWebPage("http://m.naver.com")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func btnSearch(_ sender: UIButton) {
        
        if ( textfield1.text?.isEmpty == false){
            loadWebPage(textfield1.text!)
        }
    }
    
    @IBAction func btnStop(_ sender: Any) {
        webview1.stopLoading()
    }
    
    
    @IBAction func btnRefresh(_ sender: Any) {
        webview1.reload()
    }
    
    @IBAction func btnRewind(_ sender: Any) {
        webview1.goBack()
    }
    
    @IBAction func btnForward(_ sender: Any) {
        webview1.goForward()
    }
}

