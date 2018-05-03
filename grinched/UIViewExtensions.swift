//
//  UIViewExtensions.swift
//  bullEye
//
//  Created by antonio martin moreno on 29/04/2018.
//  Copyright © 2018 antonio martin moreno. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func fadeIn(_ duration: TimeInterval = 2.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0;
            self.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }, completion: completion)  }
    
    func fadeOut(_ duration: TimeInterval = 2.0, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.alpha = 1.0;
            self.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }, completion: completion)
    }
    
    func fadeViewInThenOut(delay: TimeInterval) {
        let animationDuration = 2.0
        // Fade in the view
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
            self.alpha = 1
        }) { (Bool) -> Void in
            // After the animation completes, fade out the view after a delay
            UIView.animate(withDuration: animationDuration, delay: delay, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
                self.alpha = 0
            },completion: nil)
        }
    }
    
    func appearLeftToRight(boundsWith:CGFloat,delay: TimeInterval){
        UIView.animate(withDuration: 0.5, delay: delay, options: [], animations: {
            self.center.x += boundsWith
        }, completion: nil)
    }
    
    func bounce(boundsWith:CGFloat,delay: TimeInterval){
        UIView.animate(withDuration: 0.5, delay: delay,
                       usingSpringWithDamping: 0.1, initialSpringVelocity: 0.0, options: [],
                       animations: {
                        self.center.y -= boundsWith
                        self.alpha = 1.0
        }, completion: nil)
    }
    

    
}

