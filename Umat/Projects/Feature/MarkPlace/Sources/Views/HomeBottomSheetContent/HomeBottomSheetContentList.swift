//
//  HomeBottomSheetContentList.swift
//  MarkPlace
//
//  Created by 지준용 on 2/23/24.
//

import SwiftUI

import DesignSystem
import Entity
import Utility

struct HomeBottomSheetContentList: View {
    
    // MARK: - Properties
    @ObservedObject private var viewModel: HomeBottomSheetContentViewModel
    
    // MARK: - Init
    init(viewModel: HomeBottomSheetContentViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Views
    var body: some View {
        if viewModel.filters[viewModel.filterIndex].wishList.isEmpty {
            nothingWishList()
        } else {
            wishList()
        }
    }
}

// MARK: - NothingWishList
// 위시리스트가 없을 때
fileprivate extension HomeBottomSheetContentList {
    @ViewBuilder
    func nothingWishList() -> some View {
        let filterType = FilterType(rawValue: viewModel.filterIndex) ?? .we
        
        VStack(spacing: 0) {
            Text(filterType.emptyHeaderText)
                .pretendard(.semiBold12)
                .foregroundStyle(.colors(.gray400))
                .padding(.bottom, 8)
            
            Text(filterType.emptyContentText)
                .pretendard(.semiBold16)
                .foregroundStyle(.colors(.gray800))
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .padding(.horizontal, 85)
                .padding(.bottom, 18)
            
            Button {
                Logger.print(filterType.emptyButtonLabel)
                
                switch filterType {
                case .we:
                    break
                case .me:
                    openNaverMapApp()
                case .you:
                    break
                }
            } label: {
                TextWithColoredSubstring(originalText: filterType.emptyButtonLabel,
                                         coloredSubstring: "네이버 지도",
                                         originalColor: .colors(.gray800),
                                         substringColor: .colors(.notGood))
                    .pretendard(.semiBold14)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.colors(.gray300))
                    }
            }
        }
        .padding(.top, 20)
    }
}

// MARK: - WishList
// 위시리스트가 있을 때
fileprivate extension HomeBottomSheetContentList {
    @ViewBuilder
    func wishList() -> some View {
        let filter = viewModel.filters[viewModel.filterIndex]
        
        ForEach(filter.wishList, id: \.id) { list in
            VStack {
                HStack(spacing: 14) {
                    placeImage(of: list)
                    
                    placeMainInfo(of: list)
                }
                .padding(.top, 16)
                .padding(.bottom, 10)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                placeSubInfo(of: list)
                
                wantToGoButton(hasWishList: viewModel.server.me.wishlist.contains(list)) { // 서버에 있는지 확인
                    if let index = viewModel.server.me.wishlist.firstIndex(of: list) {
                        
                        viewModel.deletePlace(index: index)  // 서버 및 로컬 스토리지에서만 삭제
                    } else {
                        viewModel.addPlace(selectedPlace: list)  // 서버 및 로컬 스토리지에서만 추가
                    }
                }
            }
        }
    }
    
    
    @ViewBuilder
    func placeImage(of list: Place) -> some View {
        AsyncImage(url: list.imageURL) { phase in
            switch phase {
            case .empty:
                Image.icons(.ic_location_check_filled)
            case .failure:
                Image.icons(.ic_location_check_filled)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            default:
                ProgressView()
            }
        }
        .frame(width: 56, height: 56)
        .background(.colors(.gray100))
        .clipShape(
            RoundedRectangle(cornerRadius: 4)
        )
    }
    
    @ViewBuilder
    func placeMainInfo(of list: Place) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(list.name)
                .pretendard(.bold16)
                .foregroundStyle(.colors(.gray900))
            
            ScrollView(.horizontal) {
                Text(list.address)
                    .pretendard(.semiBold12)
                    .foregroundStyle(.colors(.gray500))
            }
        }
    }
    
    @ViewBuilder
    func placeSubInfo(of list: Place) -> some View {
        HStack {
            Text("오늘 영업시간")
                .pretendard(.semiBold12)
                .foregroundStyle(.colors(.both))
            
            // TODO: - Place의 요일별 영업시간을 배열로 받아야 함.
            Text("\(list.openingHour)~\(list.closingHour)")
                .pretendard(.regular12)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            
            Button {
                Logger.print("Expandable List")
            } label: {
                Image.icons(.ic_more_outlined)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
        .background(.colors(.gray100))
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    func wantToGoButton(hasWishList: Bool, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            HStack(spacing: 6) {
                Image.icons(hasWishList ? .ic_heart_filled : .ic_heart_outlined)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(hasWishList ? Color.gradient() :  Color.gradient(leading: .colors(.gray800),
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
                    .stroke(hasWishList ? Color.gradient() : Color.gradient(leading: .colors(.gray300),
                                                                            trailing: .colors(.gray300)))
            }
        }
        .padding(.horizontal, 16)
    }
}



fileprivate extension FilterType {
    var emptyHeaderText: String {
        switch self {
        case .we:
            return "앗, 아직 정해진 위시 플레이스가 없네요."
        case .me:
            return "앗, 아직 저장된 위시 플레이스가 없네요."
        case .you:
            return "앗, 아직 상대방의 위시 플레이스가 없네요."
        }
    }
    
    var emptyContentText: String {
        switch self {
        case .we:
            return "함께 가고 싶은 곳이 어딜지 토너먼트로 정해볼까요?"
        case .me:
            return "네이버 지도앱에서 공유하기를 통해 장소를 저장해요!"
        case .you:
            return "상대방이 위시 플레이스를 추가하도록 메시지를 보낼까요?"  // TODO: - activitySheet 사용해서 메시지
        }
    }
    
    var emptyButtonLabel: String {
        switch self {
        case .we:
            return "시작하기"
        case .me:
            return "네이버 지도로 이동" // 네이버지도로 이동
        case .you:
            return "보내기"
        }
    }
}

