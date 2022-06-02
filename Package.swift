// swift-tools-version:5.5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let packageName = "Demo"

// Necessary for `sourcekit-lsp` support in VSCode:`

let package = Package(
  name: packageName,
  platforms: [
    .iOS(.v14),
    // disable building on macOS
    .macOS("99.0"),
  ],
  products: [
    .library(name: packageName, targets: [packageName])
  ],
  targets: [
    .target(
      name: packageName,
      path: packageName
    )
  ]
)
