//
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit

enum IRScrubbableAnimationStrategyType {
    case LinearScrubbable

}

protocol IRScrubbableAnimationStrategy {
    func animatorFor(view:UIView) -> UIViewPropertyAnimator
}

struct IRScrubbableAnimationStrategyFactory {
    let model : [IRScrubbableAnimationStrategyType : IRScrubbableAnimationStrategy] =
        [
         IRScrubbableAnimationStrategyType.LinearScrubbable : LinearScrubbableStrategy()
    ]

    func strategyFor(type: IRScrubbableAnimationStrategyType) -> IRScrubbableAnimationStrategy {
        return model[type]!
    }
}


private func translate(view: UIView) {
    let currentCenter = view.center
    let finalCenter = CGPoint(x: currentCenter.x + 250.0, y: currentCenter.y)
    view.center = finalCenter
}

struct LinearScrubbableStrategy : IRScrubbableAnimationStrategy{

    func animatorFor(view:UIView) -> UIViewPropertyAnimator {
        let animator = UIViewPropertyAnimator(duration: 5.0, curve: .easeInOut) {
            [unowned view] in
            translate(view: view)
        }

        return animator
    }
}

