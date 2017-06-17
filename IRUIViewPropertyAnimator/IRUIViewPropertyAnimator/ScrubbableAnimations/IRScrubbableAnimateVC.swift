//
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit

class IRScrubbableAnimateVC: UIViewController {

    @IBOutlet weak var animatingView: UIView!

    public var strategy : IRScrubbableAnimationStrategy?

    private var animator : UIViewPropertyAnimator?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.animator = self.strategy?.animatorFor(view: self.animatingView)
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.animator?.fractionComplete = CGFloat(sender.value)
    }


    @IBAction func sliderTouchUp(_ sender: UISlider) {

    }

}
