//
//  UserDefaultsUtils.swift
//  PlantsPlanner
//
//  Created by Volha Ivanova on 1.12.22.
//

import Foundation

class UserDefaultsUtils {
    
    static var shared = UserDefaultsUtils()
    
    func setDarkMode(enable: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(enable, forKey: Constants.DARK_MODE)
    }
    
    func getDarkMode() -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: Constants.DARK_MODE)
    }
}
