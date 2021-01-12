import UIKit

class ToastEx2 {
    
    static let shared = ToastEx2()
    
    var bgview = UIView()
    var txtLabel = UILabel()
    var exitButton = UIButton()
  
    func show(sMessage : String, VC : UIViewController) {
        
        //사이즈
        let heightVC : CGFloat = (VC.view.frame.height / 12)
        let widthVC : CGFloat = (VC.view.frame.width)
        
        
        //UIView 생성
        bgview.backgroundColor = UIColor(red: 255.0/255, green: 0.0/255, blue: 0.0/255, alpha: 1.0)
        bgview.clipsToBounds = true
        
        
        //label 생성
        txtLabel.font = UIFont.systemFont(ofSize: 15)
        txtLabel.backgroundColor = .clear
        txtLabel.textColor = .white
        txtLabel.textAlignment = .center
        txtLabel.clipsToBounds = true
        txtLabel.numberOfLines = 1 // 0이면 무제한 라인
        txtLabel.text = "label 생성"
        bgview.addSubview(txtLabel)
        
        
        //button 생성
        exitButton.imageView?.contentMode = .scaleAspectFit
        let img =  btnimgResize(image: UIImage(named: "exit")!, size: CGSize(width: 20, height: 20))
        exitButton.setImage(img, for: .normal)
        exitButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        bgview.addSubview(exitButton)
        
        
        //메인뷰 추가
        VC.view.addSubview(bgview)
        
        
        /*
        //UIView 가운데
        bgview.translatesAutoresizingMaskIntoConstraints = false
        bgview.centerXAnchor.constraint(equalTo: VC.view.centerXAnchor).isActive = true
        bgview.centerYAnchor.constraint(equalTo: VC.view.centerYAnchor).isActive = true
        bgview.heightAnchor.constraint(equalToConstant: heightVC).isActive = true
        bgview.widthAnchor.constraint(equalToConstant: widthVC).isActive = true
        */
        
        /*
        //UIView 상단
        bgview.translatesAutoresizingMaskIntoConstraints = false
        bgview.leadingAnchor.constraint(equalTo: VC.view.leadingAnchor).isActive = true
        bgview.trailingAnchor.constraint(equalTo: VC.view.trailingAnchor).isActive = true
        bgview.topAnchor.constraint(equalTo: VC.view.safeAreaLayoutGuide.topAnchor).isActive = true
        //bgview.topAnchor.constraint(equalTo: VC.view.topAnchor).isActive = true
        bgview.heightAnchor.constraint(equalToConstant: heightVC).isActive = true
        bgview.widthAnchor.constraint(equalToConstant: widthVC).isActive = true
        */
        
        //UIView 하단
        bgview.translatesAutoresizingMaskIntoConstraints = false
        bgview.leadingAnchor.constraint(equalTo: VC.view.leadingAnchor).isActive = true
        bgview.trailingAnchor.constraint(equalTo: VC.view.trailingAnchor).isActive = true
        bgview.bottomAnchor.constraint(equalTo: VC.view.bottomAnchor).isActive = true
        //bgview.bottomAnchor.constraint(equalTo: VC.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bgview.heightAnchor.constraint(equalToConstant: heightVC).isActive = true
        bgview.widthAnchor.constraint(equalToConstant: widthVC).isActive = true
        
        
        //label 가운데
        txtLabel.translatesAutoresizingMaskIntoConstraints = false
        txtLabel.centerXAnchor.constraint(equalTo: bgview.centerXAnchor).isActive = true
        txtLabel.centerYAnchor.constraint(equalTo: bgview.centerYAnchor).isActive = true
        
        
        //button 오른쪽 상단
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.topAnchor.constraint(equalTo: bgview.topAnchor, constant: 10).isActive = true
        exitButton.trailingAnchor.constraint(equalTo: bgview.trailingAnchor, constant: -10).isActive = true
    }
    
    @objc private func close() {
        
        self.txtLabel.removeFromSuperview()
        self.exitButton.removeFromSuperview()
        self.bgview.removeFromSuperview()
    }
    
    func btnimgResize(image : UIImage, size : CGSize) -> UIImage? {
        
        let alpha = true
        let scale : CGFloat = 0.0
        
        UIGraphicsBeginImageContextWithOptions(size, !alpha, scale)
        image.draw(in: CGRect(origin: CGPoint.zero, size: size))
        
        let scaleImg = UIGraphicsGetImageFromCurrentImageContext()
        return scaleImg
    }
    
}
