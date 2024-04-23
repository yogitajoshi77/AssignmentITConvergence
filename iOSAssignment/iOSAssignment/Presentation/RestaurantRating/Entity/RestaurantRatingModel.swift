//
//  RestaurantRatingModel.swift
//  iOSAssignment
//
//  Created by Yogi on 19/04/24.
//

import Foundation
import SwiftData

@Model
final class RestaurantRating {
    // MARK: - Properties
    var restaurant: Restaurant?
    var rating: Double
    var date: Date
    var notes: String
    
    // MARK: - Init method
    init(restaurant: Restaurant?, rating: Double, date: Date, notes: String) {
        self.restaurant = restaurant
        self.rating = rating
        self.date = date
        self.notes = notes
    }
}
