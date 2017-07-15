//
//  Copyright © 2017 Info Reqd. All rights reserved.
//

import UIKit
enum IRSegueIdentifier : String {
    case showAnimation = "ShowAnimation"
    case showScrubbableAnimation = "ShowScrubbableAnimation"
}

struct IRTVSection {
    let sectionSegueIdentifier : IRSegueIdentifier
    let model : [Any]
}


func sections() -> [IRTVSection] {
    
    let keyframeSection = IRTVSection(sectionSegueIdentifier: .showAnimation,
                                 model: [
                                    IRAnimationStrategyType.KFTwoAnimation,
                                    IRAnimationStrategyType.KFPositionKeyTimesShake,
                                    IRAnimationStrategyType.KFPositionKeyTimes,
                                    IRAnimationStrategyType.KFPosition
        ])
    
    let oneSection = IRTVSection(sectionSegueIdentifier: .showAnimation,
                                 model: [
                                    IRAnimationStrategyType.KFTwoAnimation,
                                    IRAnimationStrategyType.KFPositionKeyTimesShake,
                                    IRAnimationStrategyType.KFPositionKeyTimes,
                                    IRAnimationStrategyType.KFPosition,
                                    IRAnimationStrategyType.SingleProperty,
                                    IRAnimationStrategyType.CornerRadius,
                                    IRAnimationStrategyType.CustomBezier,
                                    IRAnimationStrategyType.SpringEffect,
                                    IRAnimationStrategyType.MultipleBlocks,
                                    IRAnimationStrategyType.Transform,
                                    IRAnimationStrategyType.BackgroundColor,
                                    IRAnimationStrategyType.ReversedAnimation,
                                    IRAnimationStrategyType.BoundsChange
        ])
    
    
    let twoSection = IRTVSection(sectionSegueIdentifier: .showAnimation,
                                 model: [
                                    IRAnimationStrategyType.GradientStartEndPoint,
                                    IRAnimationStrategyType.GradientLocation,
                                    IRAnimationStrategyType.GradientColors
        ])
    let threeSection = IRTVSection(sectionSegueIdentifier: .showAnimation,
                                   model: [
                                    IRAnimationStrategyType.ShapeLayerStrokeEnd,
                                    IRAnimationStrategyType.ShapeLayerPath,
                                    IRAnimationStrategyType.ShapeLayerLineDashPhase
        ])
    let fourSection = IRTVSection(sectionSegueIdentifier: .showAnimation,
                                  model: [
                                    IRAnimationStrategyType.ShapeLayerQuarterCircleActivity
        ])
    let fiveSection = IRTVSection(sectionSegueIdentifier: .showScrubbableAnimation,
                                  model: [
                                    IRScrubbableAnimationStrategyType.LinearScrubbable
        ])
    
    return [
        keyframeSection,
        oneSection,
        twoSection,
        threeSection,
        fourSection,
        fiveSection
    ]
}

class IRAnimationsTVC: UITableViewController {
    
    let model : [IRTVSection]
    
    override init(style: UITableViewStyle) {
        model = sections()
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        model = sections()
        super.init(coder: aDecoder)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: self.model[indexPath.section].sectionSegueIdentifier.rawValue, sender: indexPath)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = sender as? NSIndexPath {

            switch indexPath.section {
            case 4:
                if let strategyType = self.model[indexPath.section].model[indexPath.row] as? IRScrubbableAnimationStrategyType {
                    if let destination = segue.destination as? IRScrubbableAnimateVC {
                        destination.strategy = IRScrubbableAnimationStrategyFactory().strategyFor(type: strategyType)
                    }
                }
                break;

            default:
                if let strategyType = self.model[indexPath.section].model[indexPath.row] as? IRAnimationStrategyType {
                    if let destination = segue.destination as? IRAnimateVC {
                        destination.strategy = IRAnimationStrategyFactory().strategyFor(type: strategyType)
                    }
                }
                break;
            }
        }
    }
}
