//
//  ModelData.swift
//  Landmarks
//
//  Created by main on 7/28/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    // don't need @Published, becasue data won't update after loaded
    var hikes: [Hike] = load("hikeData.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("coundn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Cound't parse \(filename) as \(T.self):\n\(error)")
    }
}
