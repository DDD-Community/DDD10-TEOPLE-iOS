//
//  TournamentView.swift
//  MarkPlace
//
//  Created by 지준용 on 2/24/24.
//

import SwiftUI

import DesignSystem

struct TournamentView: View {
    
    // MARK: - Properties
    @Binding private var isPresented: Bool
    @State private var isShowingAlert = false
    @State private var number: CGFloat = 20
    
    // MARK: - Init
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    // MARK: - Views
    var body: some View {
        BaseView {
            header()
        } content: {
            content()
        }
    }
}


// MARK: - Header
extension TournamentView {
    @ViewBuilder
    func header() -> some View {
        VStack(spacing: 0) {
            CustomToolBar(title: "토너먼트",
                          trailingIcon: .ic_cancel_big_outlined,
                          trailingAction: {
                isShowingAlert = true
            })
            .alert("앗! 나가시면 저장되지 않아요", isPresented: $isShowingAlert) {
                Button("계속 토너먼트하기") {
                    isShowingAlert = false
                }
                Button("나가기") {
                    isPresented = false
                }
            } message: {
                Text("""
                     지금까지 결정한 내용이
                     나가게 되면 사라져버려요.
                     """)
            }
            
            progressGauge()
        }
    }
    
    @ViewBuilder
    func progressGauge() -> some View {
        VStack {
            Gauge(value: number, in: 0...100) {}
                .gaugeStyle(.accessoryLinearCapacity)
                .tint(.colors(.both))
                .overlay {
                    HStack {
                        heartImage()
                        
                        Spacer()
                        
                        heartImage()
                        
                        Spacer()
                        
                        heartImage()
                    }
                }
            
            HStack {
                Text("20강")
                    .foregroundStyle(.colors(.both))
                
                Spacer()
                
                Text("준결승")
                    .foregroundStyle(.colors(.gray300))
                
                Spacer()
                
                Text("결승")
                    .foregroundStyle(.colors(.gray300))
            }
            .pretendard(.bold12)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
        .padding(.top, 13)
        .padding(.bottom, 12)
    }
    
    @ViewBuilder
    func heartImage() -> some View {
        Image.icons(.ic_heart_filled)
            .renderingMode(.template)
            .scaledToFill()
            .foregroundStyle(.colors(.both))
            .frame(width: 12, height: 10)
    }
}

// MARK: - Content
extension TournamentView {
    @ViewBuilder
    func content() -> some View {
        HStack(alignment: .top, spacing: 0) {
            ForEach(0..<2, id: \.self) { number in
                candidatePlace(number)
            }
        }
    }
    
    @ViewBuilder
    func candidatePlace(_ number: Int) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            placeImage(url: URL(string: "https://picsum.photos/300"))
            
            VStack(alignment: .leading, spacing: 2) {
                placeTitle(text: "복숭아는조아조아조아")
                    .padding(.bottom, 16)
                    .lineLimit(1)
                
                categoryTitle(text: "운영시간")
                Text("12:30~22:00")
                    .pretendard(.semiBold16)
                    .padding(.bottom, 12)
                    .foregroundStyle(.colors(.gray500))
                
                if !"가격".isEmpty {
                    categoryTitle(text: "가격")
                    Text("10000원대")
                        .pretendard(.semiBold16)
                        .padding(.bottom, 12)
                        .foregroundStyle(.colors(.gray500))
                }
                
                categoryTitle(text: "별점")
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 16, height: 16)
                    
                    Text("3.8")
                        .pretendard(.semiBold16)
                    
                    Text("(613)")
                        .pretendard(.semiBold12)
                }
                .foregroundStyle(.colors(.gray500))
            }
            .padding(.leading, number == 0 ? 24 : 12)
            .padding(.trailing, number == 0 ? 12 : 24)
            
            Spacer()
            
            wantToGoButton(isSelected: false) {
                // TODO: 확장 애니메이션
                // TODO: 데이터 전환
                // TODO: 버튼 상태(isSelected) 초기화
            }
        }
    }
    
    @ViewBuilder
    func placeImage(url: URL?) -> some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
            default:
                ProgressView()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 316)
        .scaledToFill()
        .padding(.bottom, 20)
    }
    
    @ViewBuilder
    func placeTitle(text: String) -> some View {
        HStack(spacing: 8) {
            Image.icons(.ic_pin)
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(.colors(.both))
                .frame(width: 20, height: 20)
            
            Text(text)
                .pretendard(.semiBold18)
                .foregroundStyle(.black)
        }
    }
    
    @ViewBuilder
    func categoryTitle(text: String) -> some View {
        Text(text)
            .pretendard(.regular12)
            .foregroundStyle(.colors(.gray500))
            .padding(.bottom, 2)
    }
    
    @ViewBuilder
    func wantToGoButton(isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            HStack(spacing: 6) {
                Image.icons(isSelected ? .ic_heart_filled : .ic_heart_outlined)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(isSelected ? Color.gradient() :  Color.gradient(leading: .colors(.gray800),
                                                                                      trailing: .colors(.gray800)))
                    .frame(width: 20, height: 20)
                    .clipped(antialiased: true)

                
                Text("여기 가볼래")
                    .pretendard(.semiBold14)
                    .foregroundStyle(.colors(.gray800))
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Color.gradient() : Color.gradient(leading: .colors(.gray300),
                                                                            trailing: .colors(.gray300)))
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}
