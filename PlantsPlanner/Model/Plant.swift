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
    var category: String
    var description: String
    
    private var imageName: String
     var image: Image {
         Image(imageName)
     }
}
