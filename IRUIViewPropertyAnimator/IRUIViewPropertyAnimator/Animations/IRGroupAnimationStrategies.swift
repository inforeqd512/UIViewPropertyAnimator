//
//  IRGroupAnimationStrategies.swift
//  IRUIViewPropertyAnimator
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
        strokeStartAnimation.fromValue = strokeStartBeginValue
        strokeStartAnimation.toValue = strokeStartEndValue
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = strokeEndBeginValue
        strokeEndAnimation.toValue = strokeEndLastValue
        
        let group = CAAnimationGroup()
        group.animations = [strokeStartAnimation, strokeEndAnimation]
        group.duration = 2.0
        group.repeatCount = Float.greatestFiniteMagnitude
        shapeLayer.add(group, forKey: "ShapeLayerQuarterCircleActivityStrategy")
        
        shapeLayer.strokeEnd = strokeEndLastValue
        shapeLayer.strokeStart = strokeStartEndValue
        
    }
}
