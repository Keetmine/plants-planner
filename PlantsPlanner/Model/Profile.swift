//
//  Profile.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 29.11.22.
//

import Foundation
import SwiftUI

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    var location = ""
    var climate = ""
    
    var imageName: String
    var image: Image {
     Image(imageName)
    }
    
    static let `default` = Profile(username: "keetmine", imageName: "peach")


    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { rawValue }
    }
}
