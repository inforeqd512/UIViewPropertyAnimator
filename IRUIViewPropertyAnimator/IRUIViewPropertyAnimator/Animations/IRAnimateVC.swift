//
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit

/*
 Note:
 1) The animation is defined through a closure, really similarly to the UIView animation helpers “UIView.animation(duration:…)”.
 2) An object, the animator, is returned.
 3) The animation is not started immediately, but is triggered with the startAnimation() function.
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
