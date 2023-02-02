// swift-tools-version: 5.7
// swiftformat:disable all
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RobotVacuum",
    defaultLocalization: "zh-Hans",
    platforms: [
        .iOS(.v11),
        .macOS(.v11),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "RobotVacuum", targets: ["AccountUI", "Tabbar", "Common"]),
        .library(name: "AccountUI", targets: ["AccountUI"]),
        .library(name: "Tabbar", targets: ["Tabbar"]),
        .library(name: "Common", targets: ["Common"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/SURYAKANTSHARMA/CountryPicker.git", .upToNextMajor(from: "2.1.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AccountUI",
            dependencies: [
                .product(name: "CountryPicker", package: "CountryPicker"),
                "Common",
            ]
        ),
        .target(
            name: "Tabbar",
            dependencies: [
                "Common",
                "AccountUI",
            ]
        ),
        .target(
            name: "Common",
            dependencies: [
                .product(name: "SnapKit", package: "SnapKit"),
            ],
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedFramework("Foundation"),
            ]
        ),
    ]
)
