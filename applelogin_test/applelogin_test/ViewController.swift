import UIKit
import AuthenticationServices

@available(iOS 13.0, *)
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn1_click(_ sender: UIButton) {
        
        appleLogin()
    }
    
    func appleLogin(){
        
        let authorizationProvider = ASAuthorizationAppleIDProvider()
        let request = authorizationProvider.createRequest()
        request.requestedScopes = [.email]//request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

@available(iOS 13.0, *)
extension ViewController : ASAuthorizationControllerDelegate {
    
    //로그인 완료시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else { return }
        print("user:\(appleIDCredential.user) , email:\(appleIDCredential.email), fullName:\(appleIDCredential.fullName)")
        
        guard let applePasswordCredential = authorization.credential as? ASPasswordCredential else { return }
        print("user:\(applePasswordCredential.user) , password:\(applePasswordCredential.password)")
        
    }
    
    //에러 발생시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        
        print("에러:\(error.localizedDescription)")
    }
}

//apple 로그인 텍스트 프로바이딩
@available(iOS 13.0, *)
extension ViewController : ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
