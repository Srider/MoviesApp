//
//  Utilities.swift
//  MovieApp
//
//  Created by Srikar on 06/08/19.
//  Copyright © 2019 Srikar. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    
    static let sharedInstance = Utilities()     /* Utilities shared instance */
    var indicator:ProgressIndicator!
    
    private override init() {
        
    }
    
    //MARK: showAlert()
    public func showAlert(_ alertTitle: String!, message alertMessage: String!, style preferredStyle:UIAlertController.Style, action buttonAction:UIAlertAction!, on viewController:UIViewController) {
        
        /* Display alert.  */
        let alert:UIAlertController! = UIAlertController.init(title: alertTitle, message: alertMessage, preferredStyle: preferredStyle)
        
        alert.addAction(buttonAction)
        
        if viewController.presentedViewController == nil {
            viewController.present(alert, animated: true, completion: nil)
        } else{
            viewController.dismiss(animated: false) { () -> Void in
                viewController.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //MARK-  ProgressIndicator Methods
    func addProgressIndicator(_ onView:UIView) {
        indicator =   ProgressIndicator.init()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.backgroundColor = UIColor.darkGray
        indicator.alpha = 0.6
        onView.addSubview(indicator)
        
        onView.addConstraint(NSLayoutConstraint.init(item: indicator!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: onView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0))
        onView.addConstraint(NSLayoutConstraint.init(item: indicator!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: onView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0))
        onView.addConstraint(NSLayoutConstraint.init(item: indicator!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: onView, attribute: NSLayoutConstraint.Attribute.width, multiplier: 1, constant: 0))
        onView.addConstraint(NSLayoutConstraint.init(item: indicator!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: onView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0))
        
        onView.bringSubviewToFront(indicator)
        indicator.setUpView()
        indicator.startAnimation()
    }
    
    func removeProgressIndicator() {
        if indicator.isAnimating() {
            indicator.stopAnimation()
            indicator.removeFromSuperview()
        }
    }

    //MARK: stopNotifier()
    deinit {
    }
}
