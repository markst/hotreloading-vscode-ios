import SwiftUI

#if DEBUG
  import Inject
#endif

struct ContentView: View {
  var body: some View {
    VStack {
      Text("Hello World")
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

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
