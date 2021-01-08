import UIKit
import WebKit

class item1: UIViewController {
    
    @IBOutlet weak var searchbar1: UISearchBar!
    
    @IBOutlet weak var webview1: WKWebView!

    @IBOutlet weak var activityindicator1: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityindicator1.center = self.view.center
        activityindicator1.hidesWhenStopped = true
        activityindicator1.color = UIColor.orange
        activityindicator1.stopAnimating()
        
        
        searchbar1.delegate = self
        
        
        webview1.backgroundColor = UIColor.white
        webview1.scrollView.backgroundColor = UIColor.white
        webview1.uiDelegate = self //WKUIDelegate
        webview1.navigationDelegate = self //WKNavigationDelegate
        webview1.allowsBackForwardNavigationGestures = true//webview 앞으로가기, 뒤로가기 제스처 사용 가능
        loadUrl(sUrl: "https://m.naver.com")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        if webview1 != nil{
            webview1.removeFromSuperview()
            webview1 = nil
        }
    }
    
    @IBAction func back_click(_ sender: Any) {
        if webview1.canGoBack {
            webview1.goBack()
        }
    }
    
    @IBAction func go_click(_ sender: Any) {
        if webview1.canGoForward {
            webview1.goForward()
        }
    }
    
    @IBAction func home_click(_ sender: Any) {
        loadUrl(sUrl: "https://m.naver.com")
    }
    
    @IBAction func reload_click(_ sender: Any) {
        webview1.reload()
    }
    
    func loadUrl(sUrl : String){
        
        webview1.load(URLRequest(url: URL(string:sUrl)!) )
    }
    
    func showUIActivityIndicatorView(_ show : Bool){
        
        if activityindicator1 == nil {
            return
        }
        
        if show {
            activityindicator1.startAnimating()
        } else {
            activityindicator1.stopAnimating()
        }
    }
}

extension item1 : UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if searchBar.text!.count > 0 {
            loadUrl(sUrl: searchBar.text!)
        }
        
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension item1 : WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        //print("페이지 로드 시작")
        
        self.showUIActivityIndicatorView(true)
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
            
        //print("didReceiveServerRedirectForProvisionalNavigation")
    }
       
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            
        //print("didCommit")
    }
    
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        //print("실패")
        
        self.showUIActivityIndicatorView(false)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        //print("완료")
        //print(webView.title!)
        
        self.showUIActivityIndicatorView(false)
    }
}
    
extension item1 : WKUIDelegate {
    
    //alert
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (UIAlertAction) in
            completionHandler()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //confirm
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (UIAlertAction) in
            completionHandler(true)
        }))
        
        alert.addAction(UIAlertAction(title: "취소", style: .default, handler: { (UIAlertAction) in
            completionHandler(false)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //prompt
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        //print("prompt")
    }
}
