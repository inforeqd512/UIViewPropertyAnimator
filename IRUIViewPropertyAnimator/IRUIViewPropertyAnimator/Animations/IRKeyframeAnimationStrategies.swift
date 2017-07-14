//
//  IRKeyframeAnimationStrategies.swift
//  IRUIViewPropertyAnimator
//

import UIKit

struct KFPositionStrategy : IRAnimationStrategy {
    
    func animate(view: UIView) {
        
        let layer = view.layer
        let point = layer.position
        
        let path = UIBezierPath()
        path.move(to: point)
        path.addCurve(to: CGPoint(x: point.x + 100, y: point.y), controlPoint1: CGPoint(x: point.x + 20, y: point.y - 50), controlPoint2: CGPoint(x: point.x + 50, y: point.y - 80))
        let finalPosition = CGPoint(x: point.x + 200, y: point.y)
        path.addCurve(to: finalPosition, controlPoint1: CGPoint(x: point.x + 120, y: point.y - 50), controlPoint2: CGPoint(x: point.x + 150, y: point.y - 80))
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.path = path.cgPath
        animation.duration = 2
        
        view.layer.add(animation, forKey: "positionkey")
        
        view.layer.position = finalPosition
        
    }
}

struct KFPositionKeyTimesStrategy : IRAnimationStrategy {
    
    func animate(view: UIView) {
        
        let layer = view.layer
        let point = layer.position
        
        let finalPosition = CGPoint(x: point.x + 200, y: point.y)
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.values = [point, CGPoint(x: point.x + 100, y: point.y), finalPosition]
        animation.keyTimes = [0, 0.75, 1.0]
        animation.duration = 2
        
        view.layer.add(animation, forKey: "positionkey")
        
        view.layer.position = finalPosition
        
    }
}

struct KFPositionKeyTimesShakeStrategy : IRAnimationStrategy {
    
    func animate(view: UIView) {
        
        let layer = view.layer
        let pointX = layer.position.x
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [pointX+0, pointX+10, pointX-10, pointX+10, pointX-5, pointX+5, pointX-5, pointX+0 ]
        animation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        animation.duration = 1
        
        view.layer.add(animation, forKey: "positionkey")
        
        
    }
}
