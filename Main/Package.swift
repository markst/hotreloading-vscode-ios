// swift-tools-version:5.5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let packageName = "Main"

// Necessary for `sourcekit-lsp` support in VSCode:`

let package = Package(
  name: packageName,
  platforms: [
    .iOS(.v14),
    // disable building on macOS
    .macOS("99.0")
  ],
  products: [
    .library(name: packageName, targets: [packageName])
  ],
  dependencies: [
    .package(url: "https://github.com/krzysztofzablocki/Inject.git", .branch("main")),
    .package(url: "https://github.com/johnno1962/HotReloading.git", .branch("main"))
  ],
  targets: [
    .target(
      name: packageName,
      dependencies: [
        .byNameItem(
          name: "Inject",
          condition: .when(platforms: [
            .iOS
          ])
        ),
        .byNameItem(
          name: "HotReloading",
          condition: .when(platforms: [
            .iOS
          ])
        )
      ],
      path: "Sources"
    )
  ]
)
