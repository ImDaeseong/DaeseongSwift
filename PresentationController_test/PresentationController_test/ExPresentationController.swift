
import UIKit

class ExPresentationController: UIPresentationController {
    
    private lazy var bgView : UIView = {
        let bgView = UIView()
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        bgView.alpha = 0.0
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickbgTap))
        bgView.addGestureRecognizer(tapGesture)
        
        return bgView
    }()
    
    
    override var frameOfPresentedViewInContainerView: CGRect {
        
        var frame : CGRect = .zero
        frame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerView!.bounds.size)
        frame.origin.y = containerView!.frame.height / 2
        
        return frame
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        presentedView?.layer.cornerRadius = 24
        presentedView?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        containerView?.backgroundColor = .clear
        
        containerView!.insertSubview(bgView, at: 0)
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: containerView!.topAnchor),
            bgView.leadingAnchor.constraint(equalTo: containerView!.leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: containerView!.trailingAnchor),
            bgView.bottomAnchor.constraint(equalTo: containerView!.bottomAnchor)
        ])
        
        guard let coordinator = presentedViewController.transitionCoordinator else {
            bgView.alpha = 1.0
            return
        }
        
        coordinator.animate { _ in
            self.bgView.alpha = 1.0
        }
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        guard let coordinator = presentedViewController.transitionCoordinator else {
            bgView.alpha = 0.0
            return
        }
        
        coordinator.animate { _ in
            self.bgView.alpha = 0.0
        }
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        
        presentedView!.frame = frameOfPresentedViewInContainerView
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        
        return CGSize(width: parentSize.width, height: parentSize.height / 2)
    }
}

private extension ExPresentationController {
    
    //종료
    @objc func clickbgTap() {
        presentedViewController.dismiss(animated: true)
    }
}
