//
//  RestaurantRatingVM.swift
//  iOSAssignment
//
//  Created by Yogi on 19/04/24.
//

import Foundation
class RestaurantRatingVM: ObservableObject {
    
    // MARK: - Properties
    @Published var showingSheet = false
    
    // MARK: - Init method
    init(showingSheet: Bool = false) {
        self.showingSheet = showingSheet
    }
}
