//
//  Created by Alex.M on 06.11.2023.
//

import SwiftUI

public struct AnimatedLinearGradient: View {
    @StateObject private var viewModel = AnimatedLinearGradientViewModel()

    @State private var progress: Double = 0

    var colors: [Color] = []
    var simultaneousColorsCount: Int = 2
    var animation: Animation = .linear(duration: 3)
    var startPoint: UnitPoint = .topTrailing
    var endPoint: UnitPoint = .bottomLeading

    public init(colors: [Color]) {
        self.colors = colors
    }

    public var body: some View {
        Rectangle()
            .animatableLinearGradient(
                fromGradient: viewModel.fromGradient,
                toGradient: viewModel.toGradient,
                progress: progress,
                startPoint: startPoint,
                endPoint: endPoint
            )
            .onAppear {
                viewModel.colors = colors
                viewModel.nextGradients(colors: simultaneousColorsCount)

                withAnimation(animation) {
                    progress = 1
                }
            }
            .onChange(of: colors) { value in
                viewModel.colors = value
            }
            .onAnimationCompleted(for: progress) { value in
                if value == 1 {
                    viewModel.nextGradients(colors: simultaneousColorsCount)
                    progress = 0
                    withAnimation(animation) {
                        progress = 1
                    }
                }
            }
    }
}

// MARK: - Modifiers
public extension AnimatedLinearGradient {

    func numberOfSimultaneousColors(_ count: Int) -> AnimatedLinearGradient {
        var gradient = self
        gradient.simultaneousColorsCount = count
        return gradient
    }

    func setAnimation(_ animation: Animation) -> AnimatedLinearGradient {
        var gradient = self
        gradient.animation = animation
        return gradient
    }

    func gradientPoints(start: UnitPoint, end: UnitPoint) -> AnimatedLinearGradient {
        var gradient = self
        gradient.startPoint = start
        gradient.endPoint = end
        return gradient
    }

    func gradientPoints(start: UnitPoint) -> AnimatedLinearGradient {
        gradientPoints(start: start, end: .bottomLeading)
    }

    func gradientPoints(end: UnitPoint) -> AnimatedLinearGradient {
        gradientPoints(start: .topTrailing, end: end)
    }
}
