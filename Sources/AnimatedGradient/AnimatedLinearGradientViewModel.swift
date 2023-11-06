//
//  Created by Alex.M on 06.11.2023.
//

import SwiftUI
import Combine

final class AnimatedLinearGradientViewModel: ObservableObject {
    @Published var colors: [Color] = []

    @Published private(set) var fromGradient: Gradient = Gradient(colors: [])
    @Published private(set) var toGradient: Gradient = Gradient(colors: [])

    @Published private var index = 0

    func nextGradients(colors count: Int) {
        guard !colors.isEmpty else { return }

        index = (index + 1) % colors.count

        let pairs = (0..<count)
            .compactMap { makePair(at: index + $0) }

        fromGradient = Gradient(colors: pairs.map { $0.left })
        toGradient = Gradient(colors: pairs.map { $0.right })
    }
}

private extension AnimatedLinearGradientViewModel {
    func makePair(at index: Int) -> Pair<Color>? {
        guard let left = colors[cycle: index], let right = colors[cycle: index + 1]
        else { return nil }

        return Pair(left: left, right: right)
    }
}
