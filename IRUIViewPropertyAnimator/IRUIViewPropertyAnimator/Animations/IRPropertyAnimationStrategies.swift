//
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit

private func translate(view: UIView) {
    let currentCenter = view.center
    let finalCenter = CGPoint(x: currentCenter.x + 225.0, y: currentCenter.y)
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

struct CornerRadiusStrategy : IRAnimationStrategy{
    func animate(view: UIView) {
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) {
            [unowned view] in
            view.layer.cornerRadius = 16.0
            
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

struct TransformStrategy : IRAnimationStrategy{
    func animate(view: UIView) {
        let animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut) {
            [unowned view] in
            view.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2.0))
        }
        
        animator.startAnimation()
    }
}

struct BackgroundColorStrategy : IRAnimationStrategy{
    func animate(view: UIView) {
        let animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut) {
            [unowned view] in
            view.backgroundColor = UIColor.orange
        }
        
        animator.startAnimation()
    }
}

struct ReversedAnimationStrategy : IRAnimationStrategy{
    func animate(view: UIView) {
        //Still no way to do it with property animator, have to use UIView animation
        let currentCenter = view.center
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.autoreverse], animations: {
            translate(view: view)
        }) { (completed) in
            view.center = currentCenter
        }
    }
}

struct BoundsChangeStrategy : IRAnimationStrategy{
    func animate(view: UIView) {
        let animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut) {
            [unowned view] in
            let oldBounds = view.bounds
            let newBounds = CGRect(x: oldBounds.origin.x - 10, y: oldBounds.origin.y - 10, width: oldBounds.size.width + 20, height: oldBounds.size.height + 20)
            view.bounds = newBounds
        }
        
        animator.startAnimation()
    }
}


