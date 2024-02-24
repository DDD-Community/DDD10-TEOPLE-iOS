import SwiftUI

import Authorization
import Maps
import MyPage

struct ContentView: View {
    var body: some View {
//        NavigationStack {
//            OnboardingView()
//        }
        
        VStack {
            NaverMapView()
            
            MyPageView()
        }
    }
}

#Preview {
    ContentView()
}
