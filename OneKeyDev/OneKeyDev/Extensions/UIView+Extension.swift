//
//  UIView+Extension.swift
//  OneKeyDev
//
//  Created by Ndriqim Haxhaj on 4/8/20.
//

import UIKit

extension UIView{
    
    func showLoader(activityColor: UIColor = .white, backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.3)) {
        self.isUserInteractionEnabled = true
        let backgroundView = UIView()
        let width:CGFloat = 50
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: width, height: width)
        backgroundView.layer.cornerRadius = width / 2
        backgroundView.backgroundColor = backgroundColor
        backgroundView.center = self.center
        backgroundView.tag = 475647
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: width, height: width))
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        
        self.addSubview(backgroundView)
    }
    
    func stopLoader() {
        self.isUserInteractionEnabled = true
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
}
