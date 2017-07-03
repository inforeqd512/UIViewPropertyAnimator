//
//  IRGroupAnimationStrategies.swift
//  IRUIViewPropertyAnimator
//
//  Created by Shefali Mistry on 4/7/17.
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit

private func createShapeLayer(view : UIView) -> CAShapeLayer{
    let layer = CAShapeLayer()
    layer.frame = view.bounds
    return layer
}

private func squareIn(rect : CGRect, center: CGPoint) -> CGRect{
    let minSide = min(rect.size.width, rect.size.height)
    let newRect = CGRect(x: center.x - minSide/2.0, y: center.y - minSide/2.0, width: minSide, height: minSide)
    return newRect
}


struct ShapeLayerQuarterCircleActivityStrategy : IRAnimationStrategy{
    
    func animate(view: UIView) {
        
        let shapeLayer = createShapeLayer(view: view)
        view.layer.insertSublayer(shapeLayer, at: 0)
        
        shapeLayer.path = UIBezierPath(ovalIn: squareIn(rect: shapeLayer.bounds, center: shapeLayer.position)).cgPath
        shapeLayer.fillColor = view.backgroundColor?.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 4.0
        
        let strokeStartBeginValue : CGFloat = 0.0
        let strokeEndBeginValue : CGFloat = 0.0
        
        let strokeStartEndValue : CGFloat = 1.0
        let strokeEndLastValue : CGFloat = 1.5
        
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        shapeLayer.strokeStart = strokeStartBeginValue
        strokeStartAnimation.fromValue = shapeLayer.strokeStart
        shapeLayer.strokeStart = strokeStartEndValue
        strokeStartAnimation.toValue = shapeLayer.strokeStart
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        shapeLayer.strokeEnd = strokeEndBeginValue
        strokeEndAnimation.fromValue = shapeLayer.strokeEnd
        shapeLayer.strokeEnd = strokeEndLastValue
        strokeEndAnimation.toValue = shapeLayer.strokeEnd
        
        let group = CAAnimationGroup()
        group.animations = [strokeStartAnimation, strokeEndAnimation]
        group.duration = 2.0
        group.repeatCount = Float.greatestFiniteMagnitude
        shapeLayer.add(group, forKey: "ShapeLayerQuarterCircleActivityStrategy")
        
    }
}
