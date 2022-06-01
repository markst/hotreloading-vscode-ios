// swift-tools-version:5.2

import PackageDescription

let packageName = "Demo"
let package = Package(
  name: "",
  platforms: [.iOS("14.0")],
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
