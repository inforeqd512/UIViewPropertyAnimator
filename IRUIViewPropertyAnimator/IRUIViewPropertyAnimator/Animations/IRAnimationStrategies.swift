//
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit

enum IRAnimationStrategyType {
    case SingleProperty
    case CustomBezier
    case SpringEffect
    case MultipleBlocks
}

protocol IRAnimationStrategy {
    func animate(view:UIView)
}

struct IRAnimationStrategyFactory {
    let model : [IRAnimationStrategyType : IRAnimationStrategy] =
        [IRAnimationStrategyType.SingleProperty : SinglePropertyStrategy(),
         IRAnimationStrategyType.CustomBezier : CustomBezierStrategy(),
         IRAnimationStrategyType.SpringEffect : SpringEffectStrategy(),
         IRAnimationStrategyType.MultipleBlocks : MultipleBlocksStrategy()
    ]

    func strategyFor(type: IRAnimationStrategyType) -> IRAnimationStrategy {
        return model[type]!
    }
}


private func translate(view: UIView) {
    let currentCenter = view.center
    let finalCenter = CGPoint(x: currentCenter.x + 250.0, y: currentCenter.y)
    view.center = finalCenter
}

struct SinglePropertyStrategy : IRAnimationStrategy{
    func animate(view: UIView) {
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) {
            [unowned view] in
            translate(view: view)
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
            translate(view: view)

        }
        animator.startAnimation()
    }
}

struct SpringEffectStrategy : IRAnimationStrategy{
    func animate(view: UIView) {
        let animator = UIViewPropertyAnimator(duration: 1.0, dampingRatio: 0.4) { 
            [unowned view] in
            translate(view: view)
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
            translate(view: view)
        }

        animator.startAnimation()
    }
}

