<a href="https://exyte.com/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/header-dark.png"><img src="https://raw.githubusercontent.com/exyte/media/master/common/header-light.png"></picture></a>

<a href="https://exyte.com/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/our-site-dark.png" width="80" height="16"><img src="https://raw.githubusercontent.com/exyte/media/master/common/our-site-light.png" width="80" height="16"></picture></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://twitter.com/exyteHQ"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/twitter-dark.png" width="74" height="16"><img src="https://raw.githubusercontent.com/exyte/media/master/common/twitter-light.png" width="74" height="16">
</picture></a> <a href="https://exyte.com/contacts"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/get-in-touch-dark.png" width="128" height="24" align="right"><img src="https://raw.githubusercontent.com/exyte/media/master/common/get-in-touch-light.png" width="128" height="24" align="right"></picture></a>

<p><h1 align="left">Animated Gradient</h1></p>

<p><h4>Animated linear gradient library written with SwiftUI</h4></p>


![](https://img.shields.io/github/v/tag/exyte/AnimatedGradient?label=Version)
[![License: MIT](https://img.shields.io/badge/License-MIT-black.svg)](https://opensource.org/licenses/MIT)

# Usage

## Minimal example

```swift
import AnimatedGradient

struct ContentView: View {
    var body: some View {
        AnimatedLinearGradient(colors: [.red, .green, .blue])
    }
}
```

**or**

```swift
import AnimatedGradient

struct ContentView: View {
    var body: some View {
        AnimatedLinearGradient(preset: Gradients.<present name>)
    }
}
```

## With optional parameters

```swift
import AnimatedGradient

struct ContentView: View {
    var body: some View {
        AnimatedLinearGradient(colors: [.red, .green, .blue])
            .numberOfColors(2)
            .setAnimation(.linear(duration: 5))
            .gradientPoints(start: .bottomLeading, end: .topTrailing)
    }
}
```


### Required parameters - init 
- `colors` - An array of colors between which the gradient will transition
**or**
- `preset` - Ready set of colors for gradient

### Available customizations - modifiers

- `numberOfColors(Int)` - Number of simultaneous gradient colors
- `setAnimation(Animation)` - Animation of the transition of one color to another
- `gradientPoints(start:end:)` - Linear gradient points  

## Examples

To try AnimatedGradient examples:
- Clone the repo `https://github.com/exyte/AnimatedGradient.git`
- Open `Example.xcodeproj`
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
[Grid](https://github.com/exyte/Grid) - The most powerful Grid container    
[ScalingHeaderScrollView](https://github.com/exyte/ScalingHeaderScrollView) - A scroll view with a sticky header which shrinks as you scroll  
[AnimatedTabBar](https://github.com/exyte/AnimatedTabBar) - A tabbar with number of preset animations         
[MediaPicker](https://github.com/exyte/mediapicker) - Customizable media picker     
[Chat](https://github.com/exyte/chat) - Chat UI framework with fully customizable message cells, input view, and a built-in media picker      
[ConcentricOnboarding](https://github.com/exyte/ConcentricOnboarding) - Animated onboarding flow    
[FloatingButton](https://github.com/exyte/FloatingButton) - Floating button menu    
[ActivityIndicatorView](https://github.com/exyte/ActivityIndicatorView) - A number of animated loading indicators    
[ProgressIndicatorView](https://github.com/exyte/ProgressIndicatorView) - A number of animated progress indicators    
[SVGView](https://github.com/exyte/SVGView) - SVG parser    
[LiquidSwipe](https://github.com/exyte/LiquidSwipe) - Liquid navigation animation    
[PopupView](https://github.com/exyte/PopupView) - Toasts, alerts and popups library written with SwiftUI    
