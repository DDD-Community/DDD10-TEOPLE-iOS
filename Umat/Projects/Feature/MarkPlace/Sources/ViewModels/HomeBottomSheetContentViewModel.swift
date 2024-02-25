//
//  HomeBottomSheetContentViewModel.swift
//  MarkPlace
//
//  Created by 지준용 on 2/23/24.
//

import SwiftUI
import Entity


final class HomeBottomSheetContentViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var server: Couple
    @Published var filters: [Filter]
    private(set) var filterIndex = 0
    private(set) var placeFileManager: PlaceFileManager
    
    // MARK: - Init
    init(filterIndex: Int = 0,
         server: Couple = Couple.example,
         filters: [Filter] = [],
         placeFileManager: PlaceFileManager = PlaceFileManager()) {
        self.filterIndex = filterIndex
        self.server = server
        self.filters = filters
        self.placeFileManager = placeFileManager
        
        loadWishPlace()
    }
    
    // MARK: - Methods
    private func loadWishPlace() {
        let we = Filter(name: "우리",
                        wishList: server.wishlist, // 메인화면 접속 시 서버에서 데이터 호출
                        key: "우리",
                        color: .colors(.both),
                        isSelected: true,
                        isUpdated: placeFileManager.loadPlaces(forUser: "우리") != server.wishlist) // 로컬스토리지와 서버데이터 비교
        
        let me = Filter(name: server.me.name,
                        wishList: server.me.wishlist,
                        key: "나",
                        color: .colors(.me),
                        isSelected: false,
                        isUpdated: false)
        
        let you = Filter(name: server.you.name,
                        wishList: server.you.wishlist,
                        key: "상대",
                        color: .colors(.you),
                        isSelected: false,
                        isUpdated: placeFileManager.loadPlaces(forUser: "상대") != server.you.wishlist)
        
        filters.append(contentsOf: [we, me, you])
    }
    
    // 필터탭 클릭 - 현제 필터탭 인덱스 최신화, 현재 필터
    func selectFilter(index: Int) {
        filterIndex = index
        filters[index].isUpdated = false
        
        for i in 0..<3 {
            if i != index {
                filters[i].isSelected = false
                continue
            }
            filters[i].isSelected = true
        }
        
        updateLocalStorage()
        applyScreen()
    }
    
    // 서버와 로컬 저장소에서 위시플레이스 삭제
    func deletePlace(index: Int) {
        let place = server.me.wishlist[index]
        
        // 서버
        server.me.deletePlace(place: place) // TODO: 서버에 삭제요청을 했다고 가정. 서버코드로 수정 요망

        // 로컬
        placeFileManager.savePlaces(filters[1].wishList, forUser: filters[1].key) // 로컬에서 삭제
        placeFileManager.savePlaces(filters[0].wishList, forUser: filters[0].key) // TODO: '우리'는 서버연결 후 삭제
    }
    
    // 서버와 로컬 저장소에서 위시플레이스 추가
    func addPlace(selectedPlace: Place) {
        guard let index = filters[filterIndex].wishList.firstIndex(of: selectedPlace) else { return }
        let place = filters[filterIndex].wishList[index]

        // 서버
        server.me.addPlace(place: place) // TODO: 서버에 추가요청을 했다고 가정. 서버코드로 수정 요망
        
        //로컬
        placeFileManager.savePlaces(filters[1].wishList, forUser: filters[1].key)
        placeFileManager.savePlaces(filters[0].wishList, forUser: filters[0].key) // TODO: 서버연결 후 삭제
    }
}

fileprivate extension HomeBottomSheetContentViewModel {
    
    // 로컬 저장소 최신화
    func updateLocalStorage() {
        if !filters[filterIndex].isUpdated {
            placeFileManager.savePlaces(filters[filterIndex].wishList,
                                               forUser: filters[filterIndex].key)
        }
        placeFileManager.savePlaces(filters[1].wishList, forUser: filters[1].key)
        placeFileManager.savePlaces(filters[0].wishList, forUser: filters[0].key)
    }
    
    // 탭을 누르면 화면에 적용
    func applyScreen() {
        filters[2].wishList = server.you.wishlist
        filters[1].wishList = server.me.wishlist
        filters[0].wishList = server.wishlist
    }
}
