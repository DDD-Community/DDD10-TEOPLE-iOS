import SwiftUI

struct ContentView: View {
    var body: some View {
        NaverMapsView()
            .ignoresSafeArea(edges: [.top, .bottom])
    }
}
