//
//  ModelData.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 23.08.22.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var plants: [Plant] = load("PlantsData.json")
    @Published var profile = Profile.default

    var features: [Plant] {
        plants.filter{ $0.isFeatured }
    }
    
    var categories: [String: [Plant]] {
        Dictionary(
            grouping: plants,
            by: { $0.category.rawValue }
        )
    }
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
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
