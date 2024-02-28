import SwiftUI

import Networking

struct ContentView: View {
    // 임시 뷰 모델. 향후 삭제
    private let viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            MainView()
            // 임시 뷰 모델과 함께 삭제
                .onAppear {
                    viewModel.call(quote: "ICT CoC")
                }
        }
    }
}

#Preview {
    ContentView()
}
