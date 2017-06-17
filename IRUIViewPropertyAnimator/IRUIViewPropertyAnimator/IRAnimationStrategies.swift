//
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit

enum IRAnimationStrategyType {
    case SingleProperty
    case CustomBezier
    case MultipleBlocks
}

protocol IRAnimationStrategy {
    func animate(view:UIView)
}

struct IRAnimationStrategyFactory {
    let model : [IRAnimationStrategyType : IRAnimationStrategy] =
        [IRAnimationStrategyType.SingleProperty : SinglePropertyStrategy(),
         IRAnimationStrategyType.CustomBezier : CustomBezierStrategy(),
         IRAnimationStrategyType.MultipleBlocks : MultipleBlocksStrategy()
    ]

    func strategyFor(type: IRAnimationStrategyType) -> IRAnimationStrategy {
        return model[type]!
    }
}

struct SinglePropertyStrategy : IRAnimationStrategy{
    func animate(view: UIView) {
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) {
            [unowned view] in
            let currentCenter = view.center
            let finalCenter = CGPoint(x: currentCenter.x + 250.0, y: currentCenter.y)
            view.center = finalCenter
        }

        animator.startAnimation()
    }
}

struct CustomBezierStrategy : IRAnimationStrategy{
    func animate(view: UIView) {
        let animator = UIViewPropertyAnimator(duration: 1.0,
                                              controlPoint1: CGPoint(x: 0.1, y: 0.5) ,
                                              controlPoint2: CGPoint(x: 0.5, y: 0.2)) { 
            [unowned view] in
            let currentCenter = view.center
            let finalCenter = CGPoint(x: currentCenter.x + 250.0, y: currentCenter.y)
            view.center = finalCenter
        }
        animator.startAnimation()
    }
}

struct MultipleBlocksStrategy : IRAnimationStrategy{
    func animate(view: UIView) {
        let animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut) {
            [unowned view] in
            view.alpha = 0.0
        }

        animator.addAnimations {
            let currentCenter = view.center
            let finalCenter = CGPoint(x: currentCenter.x + 250.0, y: currentCenter.y)
            view.center = finalCenter
        }

        animator.startAnimation()
    }
}

