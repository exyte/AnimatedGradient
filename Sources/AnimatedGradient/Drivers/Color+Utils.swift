//
//  Created by Alex.M on 06.11.2023.
//

import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

extension Color {
    func mix(to color: Color, progress: CGFloat) -> Color {
        let fromColor = self.components
        let toColor = color.components

        let red = fromColor.red + (toColor.red - fromColor.red) * progress
        let green = fromColor.green + (toColor.green - fromColor.green) * progress
        let blue = fromColor.blue + (toColor.blue - fromColor.blue) * progress

        return Color(red: red, green: green, blue: blue)
    }

    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, opacity: CGFloat) {

#if canImport(UIKit)
        typealias NativeColor = UIColor
#elseif canImport(AppKit)
        typealias NativeColor = NSColor
#endif

        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0

        guard NativeColor(self).getRed(&r, green: &g, blue: &b, alpha: &o) else {
            return (0, 0, 0, 0)
        }

        return (r, g, b, o)
    }
}
