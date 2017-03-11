//
//  CustomSegues.swift
//  animationSegues
//
//  Created by Etnuh on 2/8/17.
//  Copyright © 2017 Rainman Technologies. All rights reserved.
//

import UIKit

class CustomSegues: UIStoryboardSegue {
    
    
    override func perform() {
        scale()
    }
    
    func scale() {
        
        let toViewController = self.destination
        let fromViewController = self.source
        
        let containerView = fromViewController.view.superview
        let originalCenter = fromViewController.view.center
        
        toViewController.view.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        toViewController.view.center = originalCenter
        
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
            toViewController.view.transform = CGAffineTransform.identity
        }, completion: { success in
            fromViewController.present(toViewController, animated: false, completion: nil)

        })
    }

}


class UnwindScaleSegues: UIStoryboardSegue {
    
    override func perform() {
        scale()
    }
    
    func scale() {
        
        let toViewController = self.destination
        let fromViewController = self.source
        
     
        fromViewController.view.superview?.insertSubview(toViewController.view, at: 0)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .transitionFlipFromLeft, animations: {
            fromViewController.view.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        }, completion: { success in
            fromViewController.dismiss(animated: true, completion: nil)
        })
    }
    
}
