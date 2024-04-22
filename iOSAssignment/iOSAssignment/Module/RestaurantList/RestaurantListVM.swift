//
//  RestaurantListVM.swift
//  iOSAssignment
//
//  Created by Yogi on 19/04/24.
//

import Foundation

class RestaurantListVM: ObservableObject {
    // MARK: - Properties
    @Published var showingSheet = false
    @Published var showingEditRestaurantSheet = false
    @Published var selections: [String] = []

    // MARK: - init method
    init(showingSheet: Bool = false, showingEditRestaurantSheet: Bool = false) {
        self.showingSheet = showingSheet
        self.showingEditRestaurantSheet = showingEditRestaurantSheet
    }
}
