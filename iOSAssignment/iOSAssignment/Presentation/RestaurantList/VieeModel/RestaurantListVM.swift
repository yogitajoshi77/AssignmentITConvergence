//
//  RestaurantListVM.swift
//  iOSAssignment
//
//  Created by Yogi on 19/04/24.
//

import Foundation
import Observation

@Observable
final class RestaurantListVM {
    // MARK: - Properties
    var showingSheet = false
    var showingEditRestaurantSheet = false
    var selections: [String] = []

    // MARK: - init method
    init(showingSheet: Bool = false, showingEditRestaurantSheet: Bool = false) {
        self.showingSheet = showingSheet
        self.showingEditRestaurantSheet = showingEditRestaurantSheet
    }
}
