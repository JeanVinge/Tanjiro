# Tanjiro

[![Platforms](https://img.shields.io/cocoapods/p/Tanjiro.svg)](https://cocoapods.org/pods/Tanjiro)
[![License](https://img.shields.io/cocoapods/l/Tanjiro.svg)](https://raw.githubusercontent.com/jeanvinge/Tanjiro/master/LICENSE)

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/Tanjiro.svg)](https://cocoapods.org/pods/Tanjiro)

[![Travis](https://img.shields.io/travis/jeanvinge/Tanjiro/master.svg)](https://travis-ci.org/jeanvinge/Tanjiro/branches)
[![SwiftFrameworkTemplate](https://img.shields.io/badge/SwiftFramework-Template-red.svg)](http://github.com/RahulKatariya/SwiftFrameworkTemplate)

Tanjiro is a layout Wrapper using NSLayoutAnchor

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- iOS 11.0+
- Xcode 10.0+

## Installation

### Dependency Managers
<details>
  <summary><strong>CocoaPods</strong></summary>

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Tanjiro into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
use_frameworks!

pod 'Tanjiro'
```

Then, run the following command:

```bash
$ pod install
```

</details>

<details>
  <summary><strong>Carthage</strong></summary>

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Tanjiro into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "jeanvinge/Tanjiro"
```

</details>

<details>
  <summary><strong>Swift Package Manager</strong></summary>

To use Tanjiro as a [Swift Package Manager](https://swift.org/package-manager/) package just add the following in your Package.swift file.

``` swift
// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "HelloTanjiro",
    dependencies: [
        .package(url: "https://github.com/jeanvinge/Tanjiro.git")
    ],
    targets: [
        .target(name: "HelloTanjiro", dependencies: ["Tanjiro"])
    ]
)
```
</details>

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate Tanjiro into your project manually.

<details>
  <summary><strong>Git Submodules</strong></summary><p>

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add Tanjiro as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/jeanvinge/Tanjiro.git
$ git submodule update --init --recursive
```

- Open the new `Tanjiro` folder, and drag the `Tanjiro.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `Tanjiro.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `Tanjiro.xcodeproj` folders each with two different versions of the `Tanjiro.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from.

- Select the `Tanjiro.framework`.

- And that's it!

> The `Tanjiro.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

</p></details>

<details>
  <summary><strong>Embedded Binaries</strong></summary><p>

- Download the latest release from https://github.com/jeanvinge/Tanjiro/releases
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Add the downloaded `Tanjiro.framework`.
- And that's it!

</p></details>

## Usage

*Tanjiro* let you create views easily, it helps you with custom initialization and adding constraint to it.

```swift
var view = UIView().with {
    $0.backgroundColor = .green
}

container.addSubview(view)

view.layout {
    $0.centerX.equalToSuperView()
    $0.centerY.equalToSuperView()
    $0.width.constraint(equalToConstant: 150)
    $0.height.constraint(lessThanOrEqualToConstant: 50)
}
```

## Contributing

Issues and pull requests are welcome!

## Author

Jean Vinge [@jean_vinge](https://twitter.com/jean_vinge)

## License

Tanjiro is released under the MIT license. See [LICENSE](https://github.com/jeanvinge/Tanjiro/blob/master/LICENSE) for details.
