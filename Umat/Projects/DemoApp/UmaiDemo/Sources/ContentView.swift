import SwiftUI

import Maps
import MyPage

struct ContentView: View {
    var body: some View {
        VStack {
            NaverMapView()
                .ignoresSafeArea()
            
            MyPageView()
        }
    }
}

#Preview {
    ContentView()
}
