//
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit

class IRAnimationsTVC: UITableViewController {

    let model = [IRAnimationStrategyType.SingleProperty,
                 IRAnimationStrategyType.CustomBezier,
                 IRAnimationStrategyType.MultipleBlocks
    ]

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowAnimation", sender: indexPath)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = sender as? NSIndexPath {
            let strategyType = model[indexPath.row]
            if let destination = segue.destination as? IRAnimateVC {
                destination.strategy = IRAnimationStrategyFactory().strategyFor(type: strategyType)
            }
        }
    }
}
