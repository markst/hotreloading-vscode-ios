import SwiftUI

#if DEBUG
import Inject
#endif

public struct ContentView: View {
  public init() {

  }

  public var body: some View {
    VStack {
      Text("Testing")
        .padding()
        .background(Color.red)
        .border(.blue)
    }
    .enableInjection()
  }

  #if DEBUG
  @ObserveInjection var inject
  #endif
}
