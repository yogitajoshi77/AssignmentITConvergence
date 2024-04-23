//
//  RestaurantRatingVM.swift
//  iOSAssignment
//
//  Created by Yogi on 19/04/24.
//

import Foundation
import Observation

@Observable 
final class RestaurantRatingVM {
    
    // MARK: - Properties
    var showingSheet = false
    
    // MARK: - Init method
    init(showingSheet: Bool = false) {
        self.showingSheet = showingSheet
    }
}
