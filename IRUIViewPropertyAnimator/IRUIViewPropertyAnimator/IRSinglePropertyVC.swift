//
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit

class IRSinglePropertyVC : UIViewController {

    @IBOutlet weak var animatingView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) {
            [unowned self] in
            let currentCenter = self.animatingView.center
            let finalCenter = CGPoint(x: currentCenter.x + 250.0, y: currentCenter.y)
            self.animatingView.center = finalCenter
        }

        animator.startAnimation()

    }
}
