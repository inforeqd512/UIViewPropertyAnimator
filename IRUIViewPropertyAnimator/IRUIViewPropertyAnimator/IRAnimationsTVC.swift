//
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit


class IRAnimationsTVC: UITableViewController {

    let sectionSegueIdentifiers = [
        "ShowAnimation",
        "ShowAnimation",
        "ShowAnimation",
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
            IRAnimationStrategyType.BoundsChange
        ],
        [
            IRAnimationStrategyType.GradientStartEndPoint,
            IRAnimationStrategyType.GradientLocation,
            IRAnimationStrategyType.GradientColors
        ],
        [
            IRAnimationStrategyType.ShapeLayerStrokeEnd,
            IRAnimationStrategyType.ShapeLayerPath,
            IRAnimationStrategyType.ShapeLayerLineDashPhase
        ],
        [
            IRAnimationStrategyType.ShapeLayerQuarterCircleActivity
        ],
        [
            IRScrubbableAnimationStrategyType.LinearScrubbable
        ]
    ]

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: self.sectionSegueIdentifiers[indexPath.section], sender: indexPath)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = sender as? NSIndexPath {

            switch indexPath.section {
            case 0: fallthrough
            case 1: fallthrough
            case 2: fallthrough
            case 3: 
                if let strategyType = model[indexPath.section][indexPath.row] as? IRAnimationStrategyType {
                    if let destination = segue.destination as? IRAnimateVC {
                        destination.strategy = IRAnimationStrategyFactory().strategyFor(type: strategyType)
                    }
                }

            case 3:
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
