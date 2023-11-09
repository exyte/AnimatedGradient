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
    @State var duration: TimeInterval = 3
    @State var animation: Animation = .linear(duration: 3)

    @State private var showSettings = false

    var body: some View {
        ZStack {
            AnimatedLinearGradient(colors: colors)
                .numberOfColors(colorsCount)
                .setAnimation(animation)
                .gradientPoints(start: .bottomLeading, end: .topTrailing)
                .ignoresSafeArea()
        }
        .overlay(settingsButton, alignment: .bottomTrailing)
        .onChange(of: duration) { value in
            animation = .linear(duration: value)
        }
        .sheet(isPresented: $showSettings) {
            NavigationView {
                ScrollView {
                    settingsView
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Settings")
            }
            .navigationViewStyle(.stack)
        }
    }

    private var settingsButton: some View {
        Button {
            showSettings.toggle()
        } label: {
            Image(systemName: "gear")
                .resizable()
                .scaledToFit()
                .padding(6)
                .background(Circle().fill(.white))
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

            Text("Animation duration: " + String(format: "%.1f", duration))
                .font(.title2)
                .padding(.top, 8)
            Slider(value: $duration, in: 0.3...10)
        }
        .padding()
    }
}
