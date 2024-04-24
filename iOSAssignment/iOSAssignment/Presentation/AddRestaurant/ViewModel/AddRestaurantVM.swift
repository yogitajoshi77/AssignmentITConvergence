//
//  AddRestaurantVM.swift
//  iOSAssignment
//
//  Created by Yogi on 19/04/24.
//

import Foundation
import SwiftData

class AddRestaurantVM {
    
    /// This method is used to save Restaurant
    /// - Parameters:
    ///   - newItem: Restaurant
    ///   - context: ModelContext
    @discardableResult
    func saveRestaurant(newItem: Restaurant, context: ModelContext) -> Bool {
        var saveData: Bool = false
        do {
            try context.insert(newItem)
            saveData = true
        } catch {
            print("Failed to insert restaurnt: \(error)")
        }
        return saveData
    }
    
    /// This method is used for loadCuisine
    /// - Parameter context: ModelContext
    /// - Returns: [Cuisine]
    func loadCuisine(context: ModelContext) -> [Cuisine] {
        var items: [Cuisine] = [Cuisine]()
        let fetchDescriptor = FetchDescriptor<Cuisine>(sortBy: [SortDescriptor(\Cuisine.cuisinStr)])
        
        do {
            items = try context.fetch(fetchDescriptor)
        } catch {
             // Error handling here or make the function throw
        }
        return items
    }
}

