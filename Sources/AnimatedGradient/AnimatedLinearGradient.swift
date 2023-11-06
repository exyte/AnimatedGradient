//
//  Created by Alex.M on 06.11.2023.
//

import SwiftUI

public struct AnimatedLinearGradient: View {
    @StateObject private var viewModel = AnimatedLinearGradientViewModel()

    @State private var progress: Double = 0

    @Binding public var colors: [Color]
    public let colorsCount: Int
    public let animation: Animation
    public let startPoint: UnitPoint
    public let endPoint: UnitPoint

    public init(colors: Binding<[Color]>,
                colorsCount: Int,
                animation: Animation = .linear(duration: 3),
                startPoint: UnitPoint = .topTrailing,
                endPoint: UnitPoint = .bottomLeading) {
        self._colors = colors
        self.colorsCount = colorsCount
        self.animation = animation
        self.startPoint = startPoint
        self.endPoint = endPoint
    }

    public init(gradient: Gradients,
                colorsCount: Int,
                animation: Animation = .linear(duration: 3),
                startPoint: UnitPoint = .topTrailing,
                endPoint: UnitPoint = .bottomLeading) {
        self._colors = Binding(get: { gradient.colors }, set: { _ in })
        self.colorsCount = colorsCount
        self.animation = animation
        self.startPoint = startPoint
        self.endPoint = endPoint
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
                viewModel.nextGradients(colors: colorsCount)

                withAnimation(animation) {
                    progress = 1
                }
            }
            .onChange(of: colors) { value in
                viewModel.colors = value
            }
            .onAnimationCompleted(for: progress) { value in
                if value == 1 {
                    viewModel.nextGradients(colors: colorsCount)
                    progress = 0
                    withAnimation(animation) {
                        progress = 1
                    }
                }
            }
    }
}
