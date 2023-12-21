//
//  Utils.swift
//  Example
//
//  Created by Alisa Mylnikova on 21.12.2023.
//

import SwiftUI

class MockData {
    static var colorNames = [
        Color.hex("D2C7F6"): "Lavender",
        .hex("EFC6B7"): "Peach",
        .hex("F4F2C1"): "Cream",
        .hex("A2EFE9"): "Aqua",
        .hex("DCF4C4"): "Pear",
        .hex("F5B8CE"): "Mistyrose"
    ]
}

extension Color {

    static func hex(_ hex: String) -> Color {
        Color.init(hex: hex)
    }

    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0

        Scanner(string: cleanHexCode).scanHexInt64(&rgb)

        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

struct IntDoubleBinding {
    let intValue : Binding<Int>

    let doubleValue : Binding<Double>

    init(_ intValue : Binding<Int>) {
        self.intValue = intValue

        self.doubleValue = Binding<Double>(get: {
            return Double(intValue.wrappedValue)
        }, set: {
            intValue.wrappedValue = Int($0)
        })
    }
}
