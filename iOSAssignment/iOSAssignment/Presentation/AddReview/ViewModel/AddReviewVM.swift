//
//  AddReviewVM.swift
//  iOSAssignment
//
//  Created by Yogi on 23/04/24.
//

import Foundation
import SwiftData

@Observable
class AddReviewVM {
    
    /// This function is used to insert new rating in DB
    /// - Parameter newrating: RestaurantRating
    /// - Parameter context: ModelContext
    func inserRating(newRating: RestaurantRating, context: ModelContext) {
        context.insert(newRating)
    }
}
