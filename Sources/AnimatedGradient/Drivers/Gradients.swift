//
//  Created by Alex.M on 06.11.2023.
//

import UIKit.UIColor
import SwiftUI

public enum Gradients {
    #if DEBUG
    case debug
    #endif

    public var colors: [Color] {
        switch self {
#if DEBUG
        case .debug: 
            return [.red, .green, .blue, .purple, .yellow]
#endif
        }
    }
}
