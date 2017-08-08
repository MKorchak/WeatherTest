//
//  UIView + Extensions.swift
//  WeatherTest
//
//  Created by Misha Korchak on 07.08.17.
//  Copyright © 2017 Misha Korchak. All rights reserved.
//

import UIKit

extension UIView {
    func setGradientBackground(startColor: UIColor, endColor: UIColor, opacity: Float) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.bounds
        gradientLayer.opacity = opacity
        
        self.layer.addSublayer(gradientLayer)
    }
    
    func makeBlur() {
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            self.backgroundColor = UIColor.clear
            
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.alpha = 0.4
            blurEffectView.frame = self.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.insertSubview(blurEffectView, at: 0)
        } else {
            self.backgroundColor = UIColor.black
        }
    }
    
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 4
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

class ViewWithShadow: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.dropShadow()
    }
}
