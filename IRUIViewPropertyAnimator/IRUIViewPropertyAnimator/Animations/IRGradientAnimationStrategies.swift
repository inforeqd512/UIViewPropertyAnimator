//
//  IRGradientAnimationStrategies.swift
//  IRUIViewPropertyAnimator
//
//  Created by Shefali Mistry on 1/7/17.
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit
import QuartzCore

func createGradientLayer(view : UIView) -> CAGradientLayer{
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.bounds
    gradientLayer.colors = [UIColor.yellow.cgColor, view.backgroundColor!.cgColor]
    
    return gradientLayer
}

struct GradientStartEndPointStrategy : IRAnimationStrategy{
    let startValue = CGPoint(x: 0.0, y: 0.0)
    let endValue = CGPoint(x: 1.0, y: 1.0)
    
    func animate(view: UIView) {
        
        let gradientLayer = createGradientLayer(view: view)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        let animation1 = CABasicAnimation(keyPath: "startPoint")
        animation1.duration = 2.0
        gradientLayer.startPoint = startValue
        animation1.fromValue = gradientLayer.startPoint
        gradientLayer.startPoint = endValue
        animation1.toValue = gradientLayer.startPoint
        animation1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        gradientLayer.add(animation1, forKey: "startpointAnimation")
        
        
        let animation2 = CABasicAnimation(keyPath: "endPoint")
        animation2.duration = 2.0
        gradientLayer.endPoint = startValue
        animation2.fromValue = gradientLayer.endPoint
        gradientLayer.endPoint = endValue
        animation2.toValue = gradientLayer.endPoint
        animation2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        gradientLayer.add(animation2, forKey: "endpointAnimation")
        
    }
}

