//
//  RestaurantListVM.swift
//  iOSAssignment
//
//  Created by Yogi on 19/04/24.
//

import Foundation
import Observation
import SwiftData
import SwiftUI

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

// extension made to put all method in one place
extension RestaurantListVM {
    
    /// This function is used to check that if cuisine are loded or not
    /// - Returns: [Cuisine]
    func loadCuisine(context: ModelContext) -> [Cuisine] {
        var items: [Cuisine] = []
        let fetchDescriptor = FetchDescriptor<Cuisine>(sortBy: [SortDescriptor(\Cuisine.cuisinStr)])
        do {
            items = try context.fetch(fetchDescriptor)
            // print(items)
        } catch {
            // Error handling here or make the function throw
        }
        return items
    }
    
    
    /// This func is used for delete item in Restaurant list
    /// - Parameter index: pass integer index
    func deleteItems(items: [Restaurant], index: Int, context: ModelContext) {
        withAnimation {
            context.delete(items[index])
        }
    }
    
    /// This function is used for saving cuisin first time in DB, if there is any new entry in cuisinArr then only we insert data through modelContext otherwise not
    func saveCuisineDta(context: ModelContext) {
        let cuisinArr = [StringConstants.chinees, StringConstants.italian, StringConstants.indian, StringConstants.thai]
        for item in cuisinArr {
            let newItem = Cuisine(cuisinStr: item)
            if loadCuisine(context: context).contains(where: { cuisine in
                cuisine.cuisinStr == item
            }) {
                // don't save into Db
            } else {
                context.insert(newItem)
            }
        }
    }
}
