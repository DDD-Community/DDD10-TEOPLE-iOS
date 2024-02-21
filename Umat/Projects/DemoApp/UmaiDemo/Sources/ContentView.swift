import SwiftUI

import Maps
import MyPage

struct ContentView: View {
    var body: some View {
        NaverMapView()
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
