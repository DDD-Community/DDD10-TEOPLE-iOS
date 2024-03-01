import SwiftUI

import Authorization
import Networking
import Authorization

struct ContentView: View {
    var body: some View {
        NavigationStack {
            LoginView {
                MainView()
            }
        }
    }
}

#Preview {
    ContentView()
}
