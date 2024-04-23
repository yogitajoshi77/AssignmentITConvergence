//
//  RestaurantListModel.swift
//  iOSAssignment
//
//  Created by Yogi on 19/04/24.
//

import Foundation
import SwiftData

@Model
final class Restaurant {
    // MARK: - Properties
    let id: UUID = UUID()
    var name: String
    var cuisineType: [UserCuisine]
    @Relationship(inverse: \RestaurantRating.restaurant) var ratings: [RestaurantRating]?
    
    // MARK: - Init method
    init(name: String, cuisineType: [UserCuisine], ratings: [RestaurantRating]? = nil) {
        self.name = name
        self.cuisineType = cuisineType
        self.ratings = ratings
    }
}

@Model
final class UserCuisine {
    // MARK: - Properties
    var cuisinStr: String
    
    // MARK: - Init method
    init(cuisinStr: String) {
        self.cuisinStr = cuisinStr
    }
}
