//
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit

/*
 Note:
 1) The animation is defined through a closure, really similarly to the UIView animation helpers “UIView.animation(duration:…)”.
 2) An object, the animator, is returned.
 3) The animation is not started immediately, but is triggered with the startAnimation() function.
 
 SRP - creates the view hierarchy created for the animation. The aim of creating such a hierarchy is to show the animation in context of when. Doing #1 for now
 1. say the view animates itself say in response to some external trigger like the view is pushed and you want to bring attention to this piece of information.
 2. animates in response to a gesture but is not interruptible eg like a tap or a pan
 3. animates in response to a gesture but is interruptible
 
 
 */
class IRAnimateVC : UIViewController {

    @IBOutlet weak var animatingView: UIView!

    public var strategy : IRAnimationStrategy?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if let strategy = self.strategy {
            strategy.animate(view: self.animatingView)
        }

    }

}
