import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Text("Hello World")
        .padding()
        .background(Color.red)
        .border(.blue)
    }
    .eraseToAnyView()
  }

  #if DEBUG
    @ObservedObject var iO = injectionObserver
  #endif
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
