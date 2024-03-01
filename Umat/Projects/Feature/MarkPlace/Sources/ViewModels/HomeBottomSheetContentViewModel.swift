//
//  HomeBottomSheetContentViewModel.swift
//  MarkPlace
//
//  Created by 지준용 on 2/23/24.
//

import Combine
import SwiftUI

import Entity
import Maps

final class HomeBottomSheetContentViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var server: Couple
    @Published var filters: [FilteredList]
    
    private(set) var filterIndex = 0
    private(set) var placeFileManager: PlaceFileManager
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    init(filterIndex: Int = 0,
         server: Couple = Couple.example,
         filters: [FilteredList] = [],
         placeFileManager: PlaceFileManager = PlaceFileManager()) {
        self.filterIndex = filterIndex
        self.server = server
        self.filters = filters
        self.placeFileManager = placeFileManager
        
        loadWishPlace()
        subscribeSelectedPlace()
    }
    
    func titleHeaderText() -> String {
        if filters[filterIndex].wishList.isEmpty {
            return "아직 저장된 위시 플레이스가 없어요!"
        } else {
            return "총 \(filters[filterIndex].wishList.count)곳의 위시플레이스가 있어요!"
        }
    }
    
    // MARK: - Methods
    private func loadWishPlace() {
        let we = FilteredList(tab: .init(name: "우리", key: "우리", color: .colors(.both)),
                              wishList: server.wishlist, // 메인화면 접속 시 서버에서 데이터 호출
                              isSelected: true,
                              isUpdated: placeFileManager.loadPlaces(forUser: "우리") != server.wishlist) // 로컬스토리지와 서버데이터 비교
        
        let me = FilteredList(tab: .init(name: server.me.name, key:  "나", color: .colors(.me)),
                              wishList: server.me.wishlist,
                              isSelected: false,
                              isUpdated: false)
        
        let you = FilteredList(tab: .init(name: server.you.name, key: "상대", color: .colors(.you)),
                               wishList: server.you.wishlist,
                               isSelected: false,
                               isUpdated: placeFileManager.loadPlaces(forUser: "상대") != server.you.wishlist)
        
        filters.append(contentsOf: [we, me, you])
    }
    
    // 필터탭 클릭 - 현제 필터탭 인덱스 최신화, 현재 필터
    func selectFilter(index: Int) {
        Coordinator.shared.deleteAllMarkers()
        
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
        
        let places: [Place] = switch filterIndex {
        case 0:
            server.wishlist
        case 1:
            server.me.wishlist
        case 2:
            server.you.wishlist
        default:
            []
        }
        
        Coordinator.shared.createMarkers(places, markerType: MarkerType(rawValue: filterIndex) ?? MarkerType.me)
    }
    
    func subscribeSelectedPlace() {
        Coordinator.shared.$selectedPlace
            .sink {
                if let place = $0 {
                    print(place)
                }
            }
            .store(in: &cancellables)
    }
    
    // 서버와 로컬 저장소에서 위시플레이스 삭제
    func deletePlace(index: Int) {
        let place = server.me.wishlist[index]
        
        // 서버
        server.me.deletePlace(place: place) // TODO: 서버에 삭제요청을 했다고 가정. 서버코드로 수정 요망

        // 로컬
        placeFileManager.savePlaces(filters[1].wishList, forUser: filters[1].tab.key) // 로컬에서 삭제
        placeFileManager.savePlaces(filters[0].wishList, forUser: filters[0].tab.key) // TODO: '우리'는 서버연결 후 삭제
        
    }
    
    // 서버와 로컬 저장소에서 위시플레이스 추가
    func addPlace(selectedPlace: Place) {
        guard let index = filters[filterIndex].wishList.firstIndex(of: selectedPlace) else { return }
        let place = filters[filterIndex].wishList[index]

        // 서버
        server.me.addPlace(place: place) // TODO: 서버에 추가요청을 했다고 가정. 서버코드로 수정 요망
        
        //로컬
        placeFileManager.savePlaces(filters[1].wishList, forUser: filters[1].tab.key)
        placeFileManager.savePlaces(filters[0].wishList, forUser: filters[0].tab.key) // TODO: 서버연결 후 삭제
    }
}

fileprivate extension HomeBottomSheetContentViewModel {
    
    // 로컬 저장소 최신화
    func updateLocalStorage() {
        if !filters[filterIndex].isUpdated {
            placeFileManager.savePlaces(filters[filterIndex].wishList,
                                               forUser: filters[filterIndex].tab.key)
        }
        placeFileManager.savePlaces(filters[1].wishList, forUser: filters[1].tab.key)
        placeFileManager.savePlaces(filters[0].wishList, forUser: filters[0].tab.key)
    }
    
    // 탭을 누르면 화면에 적용
    func applyScreen() {
        filters[2].wishList = server.you.wishlist
        filters[1].wishList = server.me.wishlist
        filters[0].wishList = server.wishlist
    }
}
