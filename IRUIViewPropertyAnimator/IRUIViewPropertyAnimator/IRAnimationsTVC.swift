//
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit


class IRAnimationsTVC: UITableViewController {

    let segueIdentifiers = [
        "ShowAnimation",
        "ShowScrubbableAnimation"
    ]


    let model : [[Any]] = [
            [
                IRAnimationStrategyType.SingleProperty,
                IRAnimationStrategyType.CornerRadius,
                IRAnimationStrategyType.CustomBezier,
                IRAnimationStrategyType.SpringEffect,
                IRAnimationStrategyType.MultipleBlocks,
                IRAnimationStrategyType.Transform,
                IRAnimationStrategyType.BackgroundColor,
                IRAnimationStrategyType.ReversedAnimation,
                IRAnimationStrategyType.BoundsChange,
                IRAnimationStrategyType.GradientStartEndPoint,
                IRAnimationStrategyType.GradientLocation,
                IRAnimationStrategyType.GradientColors
            ],
            [
                IRScrubbableAnimationStrategyType.LinearScrubbable
            ]
    ]

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: self.segueIdentifiers[indexPath.section], sender: indexPath)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = sender as? NSIndexPath {

            switch indexPath.section {
            case 0:
                if let strategyType = model[indexPath.section][indexPath.row] as? IRAnimationStrategyType {
                    if let destination = segue.destination as? IRAnimateVC {
                        destination.strategy = IRAnimationStrategyFactory().strategyFor(type: strategyType)
                    }
                }

            case 1:
                if let strategyType = model[indexPath.section][indexPath.row] as? IRScrubbableAnimationStrategyType {
                    if let destination = segue.destination as? IRScrubbableAnimateVC {
                        destination.strategy = IRScrubbableAnimationStrategyFactory().strategyFor(type: strategyType)
                    }
                }

            default:
                break;
            }
        }
    }
}
