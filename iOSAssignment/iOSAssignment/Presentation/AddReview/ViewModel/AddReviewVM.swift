//
//  AddReviewVM.swift
//  iOSAssignment
//
//  Created by Yogi on 23/04/24.
//

//import Foundation
import Observation
import SwiftData
import SwiftUI

@Observable
class AddReviewVM {
    
    // MARK: - Properties
    @ObservationIgnored
    @Environment(\.modelContext) private var modelContext
    
    /// This function is used to insert new rating in DB
    /// - Parameter newrating: RestaurantRating
    func inserRating(newRating: RestaurantRating) {
        modelContext.insert(newRating)
    }
}
