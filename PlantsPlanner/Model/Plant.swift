//
//  Plant.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 23.08.22.
//

import Foundation
import SwiftUI

struct Plant: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    var category: Category
    
    enum Category: String, CaseIterable, Codable {
        case flowers = "Flowers"
        case plant = "Plant"
        case tree = "Tree"
    }

    
    private var imageName: String
    var image: Image {
     Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_featured") : nil
    }
}
    
