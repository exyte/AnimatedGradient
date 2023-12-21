//
//  Created by Alex.M on 06.11.2023.
//

import SwiftUI
import Flow

struct ColorPicker: View {
    @Binding var isPresented: Bool
    @Binding var selectedColors: [Color]
    @Binding var simultaneousColorsCount: Int
    @Binding var animationDuration: CGFloat

    var allColors: [Color]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("Settings")
                    .font(.system(size: 17, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 4)
                Text("Number of simultaneous colors")
                    .font(.system(size: 20, weight: .semibold))

                colorsSlider
                    .padding(.bottom, 16)

                Text("Colors")
                    .font(.system(size: 20, weight: .semibold))
                currentColorsView
                    .padding(.bottom, 10)
                allColorsView
                    .padding(.bottom, 16)

                Text("Animation")
                    .font(.system(size: 20, weight: .semibold))
                animationSlider
                    .padding(.bottom, 16)

                applyButton
            }
            .padding(16)
        }
    }

    var colorsSlider: some View {
        VStack {
            HStack {
                Text("Current")
                    .font(.system(size: 17, weight: .medium))
                Spacer()
                Text("\(simultaneousColorsCount)")
                    .font(.system(size: 17, weight: .semibold))
                    .opacity(0.4)
            }
            Slider(value: IntDoubleBinding($simultaneousColorsCount).doubleValue, in: 1...6, step: 1)
                .tint(.black)
        }
    }

    var currentColorsView: some View {
        VStack(alignment: .leading) {
            Text("Current")
                .font(.system(size: 17, weight: .medium))

            HFlow {
                ForEach(selectedColors, id: \.self) { color in
                    ColorCellView(color: color, name: MockData.colorNames[color], isSelected: true)
                        .onTapGesture {
                            if let index = selectedColors.firstIndex(where: { $0 == color }) {
                                selectedColors.remove(at: index)
                            }
                        }
                }
            }
        }
    }

    var allColorsView: some View {
        VStack(alignment: .leading) {
            Text("More colors")
                .font(.system(size: 17, weight: .medium))

            HFlow {
                ForEach(allColors, id: \.self) { color in
                    ColorCellView(color: color, name: MockData.colorNames[color], isSelected: false)
                        .onTapGesture {
                            selectedColors.append(color)
                        }
                }
            }
        }
    }

    var animationSlider: some View {
        VStack {
            HStack {
                Text("Duration")
                    .font(.system(size: 17, weight: .medium))
                Spacer()
                Text("\(animationDuration, specifier: "%.1f")")
                    .font(.system(size: 17, weight: .semibold))
                    .opacity(0.4)
            }
            Slider(value: $animationDuration, in: 1...10, step: 0.1)
                .tint(.black)
        }
    }

    private var applyButton: some View {
        Button {
            isPresented = false
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .foregroundColor(.black)
                Text("Apply now")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(.white)
                    .padding(12)
            }
            .frame(maxWidth: .infinity)
            .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.horizontal, -4)
    }
}

struct ColorCellView: View {
    var color: Color
    var name: String?
    var isSelected: Bool

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(color)
                .frame(width: 24, height: 24)
            Text(name ?? "")
                .font(.system(size: 15))
            Color.appDivider.frame(width: 1, height: 40)
                .padding(.horizontal, 4)
            Image(isSelected ? .minus : .plus)
                .padding(.trailing, 4)
        }
        .padding(.horizontal, 8)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.appDivider, lineWidth: 1), alignment: .center)
    }
}
