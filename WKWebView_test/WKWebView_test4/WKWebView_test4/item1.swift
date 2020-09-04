import UIKit
import WebKit

class item1: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    
    var webview1: WKWebView!
    
    override func loadView() {
        super.loadView()
        
        //print("loadView")
        
        let controller = WKUserContentController()
        controller.add(self, name: "iosClickEvent")
        controller.add(self, name: "iosSendClickEvent")
        
        let webconfig = WKWebViewConfiguration()
        webconfig.userContentController = controller
        
        webview1 = WKWebView(frame: .zero, configuration: webconfig)
        view1.addSubview(webview1)
        
        //webview1.uiDelegate = self
        //webview1.navigationDelegate = self
        webview1.allowsBackForwardNavigationGestures = true//webview 앞으로가기, 뒤로가기 제스처 사용 가능
        
        webview1.translatesAutoresizingMaskIntoConstraints = false
        webview1.topAnchor.constraint(equalTo: view1.topAnchor).isActive = true
        webview1.bottomAnchor.constraint(equalTo: view1.bottomAnchor).isActive = true
        webview1.leadingAnchor.constraint(equalTo: view1.leadingAnchor).isActive = true
        webview1.trailingAnchor.constraint(equalTo: view1.trailingAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("viewDidLoad")
        
        loadHtml()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //print("viewWillAppear")
    }
    
    func loadHtml(){
        if let url = Bundle.main.url(forResource: "test1", withExtension: "html", subdirectory: "html") {
            webview1.loadFileURL(url, allowingReadAccessTo: url)
        }
    }
    
    //웹페이지에 메시지 전달하기
    @IBAction func btn1_click(_ sender: UIButton) {
        
        webview1?.evaluateJavaScript("sendMessage('페이지에 메시지 전달하기')", completionHandler: { (result, err) in
            print(result!, err)
        })
        
    }
}

extension item1: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        //print("message.name: \(message.name)")
        //print("message.body: \(message.body)")
        
        switch message.name {
            
        case "iosClickEvent":
            
            print(message.name)
            
        case "iosSendClickEvent":
            
            print(message.body)
            
        default:
            break
        }
        
    }
}
