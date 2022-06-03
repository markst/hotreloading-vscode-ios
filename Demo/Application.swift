import SwiftUI

#if DEBUG
@_exported import Inject
#endif

@main
struct Application: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
