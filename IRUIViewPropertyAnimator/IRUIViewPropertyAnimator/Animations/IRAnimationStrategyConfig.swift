//
//  IRAnimationStrategy.swift
//  IRUIViewPropertyAnimator
//

import UIKit

enum IRAnimationStrategyType {
    case SingleProperty
    case CornerRadius
    case CustomBezier
    case SpringEffect
    case MultipleBlocks
    case Transform
    case BackgroundColor
    case ReversedAnimation
    case BoundsChange
    case GradientStartEndPoint
    case GradientLocation
    case GradientColors
    case ShapeLayerPath
    case ShapeLayerStrokeEnd
    case ShapeLayerLineDashPhase
    case ShapeLayerQuarterCircleActivity
    case KFPosition
    case KFPositionKeyTimes
    case KFPositionKeyTimesShake
    case KFTwoAnimation
    
}

protocol IRAnimationStrategy {
    func animate(view:UIView)
}

struct IRAnimationStrategyFactory {
    let model : [IRAnimationStrategyType : IRAnimationStrategy] =
        [
            IRAnimationStrategyType.SingleProperty : SinglePropertyStrategy(),
            IRAnimationStrategyType.CornerRadius : CornerRadiusStrategy(),
            IRAnimationStrategyType.CustomBezier : CustomBezierStrategy(),
            IRAnimationStrategyType.SpringEffect : SpringEffectStrategy(),
            IRAnimationStrategyType.MultipleBlocks : MultipleBlocksStrategy(),
            IRAnimationStrategyType.Transform : TransformStrategy(),
            IRAnimationStrategyType.BackgroundColor : BackgroundColorStrategy(),
            IRAnimationStrategyType.ReversedAnimation : ReversedAnimationStrategy(),
            IRAnimationStrategyType.BoundsChange : BoundsChangeStrategy(),
            IRAnimationStrategyType.GradientStartEndPoint : GradientStartEndPointStrategy(),
            IRAnimationStrategyType.GradientLocation : GradientLocationStrategy(),
            IRAnimationStrategyType.GradientColors : GradientColorsStrategy(),
            IRAnimationStrategyType.ShapeLayerPath : ShapeLayerPathStrategy(),
            IRAnimationStrategyType.ShapeLayerStrokeEnd : ShapeLayerStrokeEndStrategy(),
            IRAnimationStrategyType.ShapeLayerLineDashPhase : ShapeLayerLineDashPhaseStrategy(),
            IRAnimationStrategyType.ShapeLayerQuarterCircleActivity : ShapeLayerQuarterCircleActivityStrategy(),
            IRAnimationStrategyType.KFPosition : KFPositionStrategy(),
            IRAnimationStrategyType.KFPositionKeyTimes : KFPositionKeyTimesStrategy(),
            IRAnimationStrategyType.KFPositionKeyTimesShake : KFPositionKeyTimesShakeStrategy(),
            IRAnimationStrategyType.KFTwoAnimation : KFTwoAnimationStrategy()
    ]
    
    func strategyFor(type: IRAnimationStrategyType) -> IRAnimationStrategy {
        return model[type]!
    }
}

