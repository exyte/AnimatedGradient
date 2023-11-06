//
//  Created by Alex.M on 06.11.2023.
//

import SwiftUI

struct ColorPicker: View {
    @Binding var colors: [Color]

    var allColors: [Color] = [.white, .gray, .red, .green, .blue, .purple, .yellow]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Colors")
                .font(.title2)
            currentColorsView
            allColorsView
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.black)
    }

    var allColorsView: some View {
        HStack {
            Text("All: ")

            ScrollView(.horizontal) {
                HStack {
                    ForEach(allColors.enumerated().map({ $0.offset }), id: \.self) { index in
                        Button {
                            colors.append(allColors[index])
                        } label: {
                            Circle()
                                .fill(allColors[index])
                                .frame(width: 30)
                                .overlay(Image(systemName: "plus"))
                                .shadow(radius: 2)
                        }
                    }
                }
                .padding(2)
            }
        }
    }

    var currentColorsView: some View {
        HStack {
            Text("Current: ")

            ScrollView(.horizontal) {
                HStack {
                    ForEach(colors.enumerated().map({ $0.offset }), id: \.self) { index in
                        Button {
                            colors.remove(at: index)
                        } label: {
                            Circle()
                                .fill(colors[index])
                                .frame(width: 30)
                                .overlay(Image(systemName: "xmark"))
                                .shadow(radius: 2)
                        }
                    }
                }
                .padding(2)
            }
        }
    }
}
