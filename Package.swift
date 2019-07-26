// swift-tools-version:5.0
//
//  Tanjiro.swift
//  Tanjiro
//
//  Created by Jean Vinge on 01/04/19.
//  Copyright © 2019 jeanvinge. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "Tanjiro",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "Tanjiro",
            targets: ["Tanjiro"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "Tanjiro",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "TanjiroTests",
            dependencies: ["Tanjiro"],
            path: "Tests"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
