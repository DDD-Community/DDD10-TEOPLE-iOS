//
//  PlaceFileManager.swift
//  MarkPlace
//
//  Created by 지준용 on 2/21/24.
//

import Foundation

import Entity


final class PlaceFileManager {
    
    // MARK: - Properties
    private let fileName = "places.json"
    private var directoryURL: URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsURL.appendingPathComponent(fileName)
    }
    
    // MARK: - Methods
    private func fileURL(forUser userId: String) -> URL {
        return directoryURL.appendingPathComponent("\(userId).json")
    }
    
    func savePlaces(_ places: [Place], forUser userId: String) {
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(places)
            try FileManager.default.createDirectory(at: directoryURL,
                                                    withIntermediateDirectories: true)
            try data.write(to: fileURL(forUser: userId))
        } catch {
            print("Failed to save places for user \(userId): \(error)")
        }
    }
    
    func loadPlaces(forUser userId: String) -> [Place] {
        let fileURL = fileURL(forUser: userId)
        guard let data = try? Data(contentsOf: fileURL) else { return [] }
        let decoder = JSONDecoder()
        
        do {
            let places = try decoder.decode([Place].self, from: data)
            return places
        } catch {
            print("Failed to load places for user \(userId): \(error)")
            return []
        }
    }
}
