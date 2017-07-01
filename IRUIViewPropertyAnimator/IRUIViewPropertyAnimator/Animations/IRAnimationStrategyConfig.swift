//
//  IRAnimationStrategy.swift
//  IRUIViewPropertyAnimator
//
//  Created by Shefali Mistry on 1/7/17.
//  Copyright © 2017 Info Reqd. All rights reserved.
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
            IRAnimationStrategyType.ShapeLayerLineDashPhase : ShapeLayerLineDashPhaseStrategy()
    ]
    
    func strategyFor(type: IRAnimationStrategyType) -> IRAnimationStrategy {
        return model[type]!
    }
}

