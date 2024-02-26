//
//  HomeBottomSheetContentHeader.swift
//  MarkPlace
//
//  Created by 지준용 on 2/23/24.
//

import SwiftUI

import DesignSystem
import Entity

struct HomeBottomSheetContentHeader: View {
    
    // MARK: - Properties
    @ObservedObject private var viewModel: HomeBottomSheetContentViewModel
    @State private var isPresented = false
    
    // MARK: - Init
    init(viewModel: HomeBottomSheetContentViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Views
    var body: some View {
        VStack(spacing: 0) {
            currentPlace("성동구 옥수동") // TODO: (지도연동)좌표상의 장소를 기준으로 지명 띄우기
            
            TitleHeader(title: viewModel.titleHeaderText(),
                        titleFont: .pretendard(.semiBold, size: 18),
                        bottomPadding: 12)
            .padding(.horizontal, 20)
            
            Divider()
                .padding(.bottom, 14)
                .padding(.horizontal, 16)
            
            filterTabs()
            
            notificationSystem {
                isPresented = true
            }
            .fullScreenCover(isPresented: $isPresented) {
                // TODO: - 토너먼트 시작
                TournamentView(isPresented: $isPresented)
                
                // TODO: - 토너먼트 보러가기
            }
        }
        .padding(.top, 24)
    }
}


extension HomeBottomSheetContentHeader {
    @ViewBuilder
    func currentPlace(_ place: String) -> some View {
        HStack(spacing: 2) {
            Text("현위치")
                .foregroundStyle(.colors(.gray400))
            
            Text(place)
                .foregroundStyle(.colors(.gray600))
        }
        .pretendard(.bold12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 6)
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    func filterTabs() -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 6) {
                ForEach(0..<viewModel.filters.count, id: \.self) { i in
                    filterTab(name: viewModel.filters[i].tab.name,
                              count: viewModel.filters[i].wishList.count,
                              color: viewModel.filters[i].tab.color,
                              isSelected: viewModel.filters[i].isSelected,
                              isUpdated: viewModel.filters[i].isUpdated)
                    .onTapGesture {
                        viewModel.selectFilter(index: i)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.bottom, 12)
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    func filterTab(name: String,
                   count: Int,
                   color: Color,
                   isSelected: Bool,
                   isUpdated: Bool) -> some View {
        HStack(spacing: 4) {
            Image.icons(isUpdated ? .ic_pin_new : .ic_pin)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundStyle(color)
                .overlay {
                    if isUpdated {
                        Text("N")
                            .pretendard(.semiBold10)
                            .foregroundStyle(.white)
                    }
                }
            
            Text("\(name) \(count)")
                .pretendard(.semiBold12)
        }
        .padding(.horizontal, 13)
        .padding(.vertical, 8)
        .background(.white)
        .clipShape(.capsule)
        .overlay {
            Capsule()
                .strokeBorder(.colors(isSelected ? .gray800 : .gray300))
        }
    }
    
    @ViewBuilder
    func notificationSystem(action: @escaping () -> Void) -> some View {
        // TODO: 나만 토너먼트를 완료했을 때
        // TODO: 둘 다 토너먼트를 완료했을 때
        
        // TODO: 상대방만 토너먼트를 완료한 상황 (보러가기) -> FullScreenModal
        // TODO: 상대방이 토너먼트를 진행 중인 상황 (나도하기)
        
        // '우리' 위시플레이스가 3개 이상이고, 토너먼트를 아무도 시작하지 않은 경우 - (토너먼트 제안)
        if viewModel.filterIndex == 0 && viewModel.filters[0].wishList.count >= 3 {
            HStack(spacing: 0) {
                Circle()
                    .foregroundStyle(Color(hex: "FDD842"))
                    .opacity(0.35)
                    .overlay {
                        Image.icons(.ic_tornament_filled)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(.colors(.soso))
                            .padding(6)
                    }
                    .frame(width: 38, height: 38)
                    .padding(.trailing, 10)
                
                TextWithColoredSubstring(originalText: "이 곳의 많은 위시 플레이스 중 토너먼트로 한 개만 정해볼까요?",
                                         coloredSubstring: "이 곳",
                                         originalColor: .colors(.gray800),
                                         substringColor: .colors(.both))
                .pretendard(.semiBold14)
                .padding(.trailing, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                GrayButton(text: "시작하기",
                           buttonSize: .xsmall,
                           buttonState: .enabled) {
                    // TODO: 풀스크린 모달 동작 true false
                    action()
                }
                .frame(width: 65)
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity)
            .background(.colors(.gray100))
        }
    }
}
