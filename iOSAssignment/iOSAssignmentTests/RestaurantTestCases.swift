//
//  RestaurantTestCases.swift
//  iOSAssignmentTests
//
//  Created by Yogi on 24/04/24.
//

import XCTest
import SwiftData

@testable import iOSAssignment
final class RestaurantTestCases: XCTestCase {

    var viewModel: AddRestaurantVM!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = AddRestaurantVM()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    /// check Insert Restaurant is successfull
    @MainActor func testInsertRestaurantSuccess() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Restaurant.self, configurations: config)
        
        // Create a new Restaurant instance
        let restaurant = Restaurant(name: "Badami restaurant", cuisineType: [UserCuisine(cuisinStr: "Italian")], ratings: nil)

        // Insert the restaurant into the database
        let result = viewModel.saveRestaurant(newItem: restaurant, context: container.mainContext)
        XCTAssert(result == true, "restaurnt saved succesfully")
    }
    
    /// check Insert Restaurant is failure
    @MainActor func testInsertRestaurantFailure() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: UserCuisine.self, configurations: config)
        
        // Create a new Restaurant instance
        let restaurant = Restaurant(name: "Badami restaurant", cuisineType: [UserCuisine(cuisinStr: "Italian")], ratings: nil)

        // Insert the restaurant into the database
        let result = viewModel.saveRestaurant(newItem: restaurant, context: container.mainContext)
        XCTAssert(result == true, "restaurnt saved succesfully")
    }

}
