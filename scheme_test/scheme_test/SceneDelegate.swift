import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }
        
        if url.scheme == "myschemeios" {
            let params = url.queryParameters
            print("parameters: \(params)")
            showAlert(with: params)
        }
    }

    func showAlert(with parameters: [String: String]) {
        if let rootViewController = window?.rootViewController {
            let alertController = UIAlertController(title: "Alert", message: "Parameters: \(parameters)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            rootViewController.present(alertController, animated: true, completion: nil)
        }
    }
}

