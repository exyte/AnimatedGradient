//
//  ContentView.swift
//  Example
//
//  Created by Alex.M on 06.11.2023.
//

import SwiftUI
import AnimatedGradient

struct ContentView: View {
    @State var colors: [Color] = Gradients.debug.colors
    @State var colorsCount: Int = 2
    @State var animation: Animation = .linear(duration: 3)

    @State private var showSettings = !false

    var body: some View {
        ZStack {
            AnimatedLinearGradient(
                colors: $colors,
                colorsCount: colorsCount,
                animation: animation,
                startPoint: .bottomLeading,
                endPoint: .topTrailing
            )
            .ignoresSafeArea()

            if showSettings {
                settingsView
            }
        }
        .overlay(settingsButton, alignment: .bottomTrailing)
    }

    private var settingsButton: some View {
        Button {
            showSettings.toggle()
        } label: {
            if showSettings {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .padding(13)
                    .background(Circle().fill(.white))
            } else {
                Image(systemName: "gear")
                    .resizable()
                    .scaledToFit()
                    .padding(6)
                    .background(Circle().fill(.white))
            }
        }
        .frame(width: 44, height: 44)
        .foregroundColor(.black)
        .padding()
    }

    private var settingsView: some View {
        VStack(alignment: .leading) {
            ColorPicker(colors: $colors)
            Text("Number of gradient colors")
                .font(.title2)
                .padding(.top, 8)
            Stepper("Current: \(colorsCount)", value: $colorsCount, in: 2...10)
        }
        .padding()
        .background(Rectangle().fill(.white).shadow(radius: 8).padding(8))
    }
}

//#Preview {
//    ContentView()
//}
