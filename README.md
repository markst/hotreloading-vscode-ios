# SwiftUI iOS Debug & HotReloading in VSCode

Demonstrating vscode development environment using xcodegen + HotReloading.

- Language Server Protocol for Swift with [vscode-swift](https://github.com/swift-server/vscode-swift) extension.
- Lint Swift with [SwiftLint](https://github.com/shinnn/vscode-swiftlint) extension.
- Xcode project generating using [XcodeGen](https://github.com/yonaskolb/XcodeGen)
- Launch & debugging with lldb [iOS Debug](https://github.com/nisargjhaveri/vscode-ios-debug)
- HotReloading & Injection with [HotReloading](https://github.com/johnno1962/HotReloading)
- SwiftUI injection property wrapper with [Inject](https://github.com/krzysztofzablocki/Inject.git)

![hotreloading-vscode-ios 2022-06-03 20_10_56](https://user-images.githubusercontent.com/274318/171922061-cabbb0aa-b2ba-4ade-a606-41a06c3c2ca3.gif)

## Support HotReloading

One caveat to support HotReloading is to ensure the `derivedDataPath` passed to `xcodebuild` matches that when building with Xcode.

Xcode (by default) uses "Unique" build locations for each project: [Xcode DerivedData Hashes](https://pewpewthespells.com/blog/xcode_deriveddata_hashes.html)

Once the `xcodegen` task has been run the following command can be used to output the `$BUILT_PRODUCTS_DIR` including the unique location (for this demo):

```shell
$xcodebuild -project ./Demo.xcodeproj -scheme Demo -showBuildSettings | grep -m 1 "BUILT_PRODUCTS_DIR" | grep -oEi "\/.*"
```

Output:

```
~/Library/Developer/Xcode/DerivedData/Demo-avuzscipzqxczrbltxhlvbnxujdo/Build/Products/Debug-iphoneos
```

This in turn means the `.vscode/launch.json` iOS Debug `program` needs to be updated to resolve to the output `*.app` (`$CODESIGNING_FOLDER_PATH`)
