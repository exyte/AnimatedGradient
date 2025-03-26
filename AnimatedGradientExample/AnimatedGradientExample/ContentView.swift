//
//  ContentView.swift
//  Example
//
//  Created by Alex.M on 06.11.2023.
//

import SwiftUI
import AnimatedGradient

struct ContentView: View {

    @State var colors: [Color] = Array(GradientPreset.pastel.prefix(upTo: 2))
    @State var colorsCount: Int = 2
    @State var animationDuration: CGFloat = 3

    @State private var showSettings = false

    var body: some View {
        AnimatedLinearGradient(colors: colors)
            .numberOfSimultaneousColors(colorsCount)
            .setAnimation(.linear(duration: animationDuration))
            .gradientPoints(start: .bottomLeading, end: .topTrailing)
            .ignoresSafeArea()
            .overlay(settingsButton, alignment: .bottom)
    }

    private var settingsButton: some View {
        Button {
            showSettings.toggle()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .foregroundColor(.white)
                Text("Change gradient colors")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(.black)
                    .padding(12)
            }
            .frame(maxWidth: .infinity)
            .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .sheet(isPresented: $showSettings) {
            ColorPicker(isPresented: $showSettings, selectedColors: $colors, simultaneousColorsCount: $colorsCount, animationDuration: $animationDuration, allColors: GradientPreset.pastel)
        }
    }
}
