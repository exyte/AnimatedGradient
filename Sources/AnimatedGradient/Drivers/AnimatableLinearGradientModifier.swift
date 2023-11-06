//
//  Created by Alex.M on 06.11.2023.
//

import SwiftUI

public struct AnimatableLinearGradientModifier: AnimatableModifier {
    public let fromGradient: Gradient
    public let toGradient: Gradient
    public var progress: CGFloat = 0.0
    public let startPoint: UnitPoint
    public let endPoint: UnitPoint

    public var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }

    public func body(content: Content) -> some View {
        var gradientColors = [Color]()

        for i in 0..<fromGradient.stops.count {
            let fromColor = fromGradient.stops[i].color
            let toColor = toGradient.stops[i].color

            gradientColors.append(fromColor.mix(to: toColor, progress: progress))
        }

        return LinearGradient(
            gradient: Gradient(colors: gradientColors),
            startPoint: startPoint,
            endPoint: endPoint
        )
    }
}

extension View {
    public func animatableLinearGradient(
        fromGradient: Gradient,
        toGradient: Gradient,
        progress: CGFloat,
        startPoint: UnitPoint,
        endPoint: UnitPoint) -> some View {

        self.modifier(
            AnimatableLinearGradientModifier(
                fromGradient: fromGradient,
                toGradient: toGradient,
                progress: progress,
                startPoint: startPoint,
                endPoint: endPoint
            )
        )
    }
}
