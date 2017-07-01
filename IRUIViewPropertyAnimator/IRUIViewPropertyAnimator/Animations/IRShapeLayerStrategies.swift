//
//  IRShapeLayerStrategies.swift
//  IRUIViewPropertyAnimator
//
//  Created by Shefali Mistry on 1/7/17.
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit
import QuartzCore

private func createShapeLayer(view : UIView) -> CAShapeLayer{
    let layer = CAShapeLayer()
    layer.frame = view.bounds
    return layer
}

struct ShapeLayerPathStrategy : IRAnimationStrategy{
    
    func animate(view: UIView) {
        
        let shapeLayer = createShapeLayer(view: view)
        view.clipsToBounds = true
        view.layer.insertSublayer(shapeLayer, at: 0)
        
        shapeLayer.fillColor = UIColor.red.cgColor
        
        let squareSide = max(shapeLayer.bounds.size.width, shapeLayer.bounds.size.height)
        
        let bigSquareRectAroundView = CGRect(x: shapeLayer.position.x - squareSide, y: shapeLayer.position.y - squareSide, width: squareSide * 2, height: squareSide * 2)
        
        let startValue = UIBezierPath(ovalIn: CGRect(origin: CGPoint(x: shapeLayer.position.x, y: shapeLayer.position.y), size: CGSize(width: 0, height: 0))).cgPath
        let endValue = UIBezierPath(ovalIn: bigSquareRectAroundView).cgPath
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.duration = 2.0
        shapeLayer.path = startValue
        animation.fromValue = shapeLayer.path
        shapeLayer.path = endValue
        animation.toValue = shapeLayer.path
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        shapeLayer.add(animation, forKey: "pathAnimation")
        
    }
}
