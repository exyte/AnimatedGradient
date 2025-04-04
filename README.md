<a href="https://exyte.com/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/header-dark.png"><img src="https://raw.githubusercontent.com/exyte/media/master/common/header-light.png"></picture></a>

<a href="https://exyte.com/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/our-site-dark.png" width="80" height="16"><img src="https://raw.githubusercontent.com/exyte/media/master/common/our-site-light.png" width="80" height="16"></picture></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://twitter.com/exyteHQ"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/twitter-dark.png" width="74" height="16"><img src="https://raw.githubusercontent.com/exyte/media/master/common/twitter-light.png" width="74" height="16">
</picture></a> <a href="https://exyte.com/contacts"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/get-in-touch-dark.png" width="128" height="24" align="right"><img src="https://raw.githubusercontent.com/exyte/media/master/common/get-in-touch-light.png" width="128" height="24" align="right"></picture></a>

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://github.com/exyte/AnimatedGradient/assets/9447630/b205fa00-b0a0-4b07-90b6-08b3776932c6" />
            </td>
            <td>
                <img src="https://github.com/exyte/AnimatedGradient/assets/9447630/161eee68-f8df-4066-ab45-8b6342d5c343" />
            </td>
            <td>
                <img src="https://github.com/exyte/AnimatedGradient/assets/9447630/345814e0-ea6a-4df0-982d-161dcc510df1" />
            </td>
        </tr>
    </tbody>
</table>

<p><h1 align="left">Animated Gradient</h1></p>

<p><h4>Animated linear gradient library written with SwiftUI</h4></p>

![](https://img.shields.io/github/v/tag/exyte/AnimatedGradient?label=Version)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fexyte%2FAnimatedGradient%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/exyte/AnimatedGradient)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fexyte%2FAnimatedGradient%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/exyte/AnimatedGradient)
[![SPM](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)](https://swiftpackageindex.com/exyte/AnimatedGradient)
[![Cocoapods](https://img.shields.io/badge/Cocoapods-Deprecated%20after%201.0.0-yellow.svg)](https://cocoapods.org/pods/AnimatedGradient)
[![License: MIT](https://img.shields.io/badge/License-MIT-black.svg)](https://opensource.org/licenses/MIT)

# Usage

### Minimal example

```swift
import AnimatedGradient

struct ContentView: View {
    var body: some View {
        AnimatedLinearGradient(colors: [.red, .green, .blue])
    }
}
```

### With modifiers

```swift
import AnimatedGradient

struct ContentView: View {
    var body: some View {
        AnimatedLinearGradient(colors: [.red, .green, .blue])
            .numberOfSimultaneousColors(2)
            .setAnimation(.linear(duration: 5))
            .gradientPoints(start: .bottomLeading, end: .topTrailing)
    }
}
```

### Required parameters - init 
- `colors` - An array of colors between which the gradient will transition

### Available customizations - modifiers

- `numberOfSimultaneousColors(Int)` - Number of colors on screen at any given time, can be more, equal or less than colors in the array  
- `setAnimation(Animation)` - Animation of the transition of one color to another    
- `gradientPoints(start:end:)` - Standard linear gradient control points  

### Presets
You can use preselected colors from GradientPreset for a quick start

## Examples

To try AnimatedGradient examples:
- Clone the repo `https://github.com/exyte/AnimatedGradient.git`
- Open `AnimatedGradientExample.xcodeproj`
- Try it!

## Installation

### [Swift Package Manager](https://swift.org/package-manager/)

```swift
dependencies: [
    .package(url: "https://github.com/exyte/AnimatedGradient.git")
]
```

## Requirements

* iOS 14.0+ 

## Our other open source SwiftUI libraries
[PopupView](https://github.com/exyte/PopupView) - Toasts and popups library    
[AnchoredPopup](https://github.com/exyte/AnchoredPopup) - Anchored Popup grows "out" of a trigger view (similar to Hero animation)    
[Grid](https://github.com/exyte/Grid) - The most powerful Grid container    
[ScalingHeaderScrollView](https://github.com/exyte/ScalingHeaderScrollView) - A scroll view with a sticky header which shrinks as you scroll    
[AnimatedTabBar](https://github.com/exyte/AnimatedTabBar) - A tabbar with a number of preset animations   
[MediaPicker](https://github.com/exyte/mediapicker) - Customizable media picker     
[Chat](https://github.com/exyte/chat) - Chat UI framework with fully customizable message cells, input view, and a built-in media picker  
[OpenAI](https://github.com/exyte/OpenAI) Wrapper lib for [OpenAI REST API](https://platform.openai.com/docs/api-reference/introduction)    
[ConcentricOnboarding](https://github.com/exyte/ConcentricOnboarding) - Animated onboarding flow    
[FloatingButton](https://github.com/exyte/FloatingButton) - Floating button menu    
[AnimatedGradient](https://github.com/exyte/AnimatedGradient) - A number of animated loading indicators    
[ProgressIndicatorView](https://github.com/exyte/ProgressIndicatorView) - A number of animated progress indicators    
[FlagAndCountryCode](https://github.com/exyte/FlagAndCountryCode) - Phone codes and flags for every country    
[SVGView](https://github.com/exyte/SVGView) - SVG parser    
[LiquidSwipe](https://github.com/exyte/LiquidSwipe) - Liquid navigation animation    
