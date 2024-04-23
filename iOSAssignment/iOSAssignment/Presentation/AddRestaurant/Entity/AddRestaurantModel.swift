//
//  AddRestaurantModel.swift
//  iOSAssignment
//
//  Created by Yogi on 19/04/24.
//

import Foundation
import SwiftData

@Model
final class Cuisine {
    // MARK: - Variable
    var cuisinStr: String
    
    // MARK: - Init method
    init(cuisinStr: String) {
        self.cuisinStr = cuisinStr
    }
}
