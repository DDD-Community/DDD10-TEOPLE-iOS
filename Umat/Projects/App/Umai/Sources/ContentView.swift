import SwiftUI

import Networking
import Authorization

struct ContentView: View {
    var body: some View {
        NavigationStack {
            MakeNameView()
        }
    }
}

#Preview {
    ContentView()
}
