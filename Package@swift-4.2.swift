// swift-tools-version:4.2
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
    swiftLanguageVersions: [.v4, .v4_2]
)
