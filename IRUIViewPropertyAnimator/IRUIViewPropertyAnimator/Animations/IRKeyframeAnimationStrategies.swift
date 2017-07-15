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
        
        layer.add(animation, forKey: "positionkey")
        
        layer.position = finalPosition
        
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
        
        layer.add(animation, forKey: "positionkey")
        
        layer.position = finalPosition
        
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
        
        layer.add(animation, forKey: "positionkey")
    }
}

struct KFTwoAnimationStrategy : IRAnimationStrategy {
    
    func animate(view: UIView) {
        
        let widthAnimation = CAKeyframeAnimation(keyPath: "borderWidth")
        let widthValues = [1.0, 10.0, 5.0, 15.0, 0.5, 10.0, 2.0, 20.0, 0.0]
        widthAnimation.values = widthValues
        widthAnimation.calculationMode = kCAAnimationPaced
        
        let colorAnimation = CAKeyframeAnimation(keyPath: "borderColor")
        let colorValues = [UIColor.green.cgColor, UIColor.red.cgColor, UIColor.blue.cgColor]
        colorAnimation.values = colorValues
        colorAnimation.calculationMode = kCAAnimationPaced
        
        let group = CAAnimationGroup()
        group.animations = [widthAnimation, colorAnimation]
        group.duration = 5.0
        
        view.layer.add(group, forKey: "positionkey")
    }
}
