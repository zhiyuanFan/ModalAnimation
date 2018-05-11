//
//  CustomAnimator.swift
//  ModalAnimation
//
//  Created by Jason Fan on 2018/5/11.
//  Copyright © 2018 zyFan. All rights reserved.
//

import UIKit

class CustomAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool
    var duration: TimeInterval
    var originFrame: CGRect
    var transView: UIImageView?

    init(isPresenting: Bool, duration: TimeInterval, originFrame: CGRect, transView: UIImageView) {
        self.isPresenting = isPresenting
        self.duration = duration
        self.originFrame = originFrame
        self.transView = transView
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        isPresenting ? container.addSubview(toView) : container.insertSubview(toView, belowSubview: fromView)
        
        let detailView = isPresenting ? toView : fromView
        
        transView?.alpha = 0
        
        let replaceTransView = UIImageView(frame: isPresenting ? originFrame : (transView?.frame)!)
        replaceTransView.image = UIImage(named: "shoes")
        container.addSubview(replaceTransView)
        replaceTransView.layoutIfNeeded()
        
        toView.frame = isPresenting ? CGRect(x: fromView.frame.width, y: 0, width: toView.frame.width, height: toView.frame.height) : toView.frame
        toView.alpha = isPresenting ? 0 : 1
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: {
            replaceTransView.frame = self.isPresenting ? (self.transView?.frame)! : self.originFrame
            replaceTransView.layoutIfNeeded()
            detailView.frame = self.isPresenting ? fromView.frame : CGRect(x: toView.frame.width, y: 0, width: toView.frame.width, height: toView.frame.height)
            detailView.alpha = self.isPresenting ? 1 : 0
        }) { (isFinished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            replaceTransView.removeFromSuperview()
            self.transView?.alpha = 1
        }
    }
}
