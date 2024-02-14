import SwiftUI

import MyPage

struct ContentView: View {
    var body: some View {
        ZStack {
            NaverMapView()
                .ignoresSafeArea()
            
            Text("지도")
                .background(Color.blue)
        }
    }
}

#Preview {
    ContentView()
}
