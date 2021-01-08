import UIKit
import WebKit

class item1: UIViewController {
    
    @IBOutlet weak var webview1: WKWebView!
    
    var htmlString = "<html>\n<head>\n<title>webview</title>\n</head>\n<body>\n<a href =\"app://SendData\">click</a>\n</body>\n</html>"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview1.uiDelegate = self //WKUIDelegate
        webview1.navigationDelegate = self //WKNavigationDelegate
        webview1.allowsBackForwardNavigationGestures = true//webview 앞으로가기, 뒤로가기 제스처 사용 가능
        webview1.loadHTMLString(htmlString, baseURL: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        if webview1 != nil{
            webview1.removeFromSuperview()
            webview1 = nil
        }
    }
}

extension item1 : WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("페이지 로드 시작")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("didcommit")
    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        print("webViewWebContentProcessDidTerminate")
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("didReceiveServerRedirectForProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("실패")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("완료")
        print(webView.title!)
    }
    
}
    
extension item1 : WKUIDelegate {
    
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        print("confirm")
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        print("alert")
    }
    
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        print("textinput")
    }
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        print("createWebView")
        return nil
    }
    
    func webViewDidClose(_ webView: WKWebView) {
        print("webview close")
    }
}
