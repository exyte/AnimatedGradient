//
//  Created by Alex.M on 06.11.2023.
//

import Foundation

extension Collection where Index == Int {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (cycle index: Index) -> Element? {
        if isEmpty { return nil }
        let i = index % count
        return indices.contains(i) ? self[i] : nil
    }
}
