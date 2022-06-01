import Combine
import SwiftUI

#if DEBUG

  extension Notification.Name {
    static let injectionNotification = Notification.Name("INJECTION_BUNDLE_NOTIFICATION")
  }

  private var loadInjection: () = {
    // HotReloading loads itself.
  }()

  public let injectionObserver = InjectionObserver()

  public class InjectionObserver: ObservableObject {
    @Published var injectionNumber = 0
    var cancellable: AnyCancellable?
    let publisher = PassthroughSubject<Void, Never>()
    init() {
      cancellable = NotificationCenter.default.publisher(
        for:
          .injectionNotification
      )
      .sink { [weak self] _ in
        self?.injectionNumber += 1
        self?.publisher.send()
      }
    }
  }

  extension View {
    public func eraseToAnyView() -> some View {
      _ = loadInjection
      return AnyView(self)
    }
    public func onInjection(bumpState: @escaping () -> Void) -> some View {
      return
        self
        .onReceive(injectionObserver.publisher, perform: bumpState)
        .eraseToAnyView()
    }
  }
#else

  extension View {
    public func eraseToAnyView() -> some View { return self }
    public func onInjection(bumpState: @escaping () -> Void) -> some View {
      return self
    }
  }

#endif
