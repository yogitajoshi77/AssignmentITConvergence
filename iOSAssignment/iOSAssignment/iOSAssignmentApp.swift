//
//  iOSAssignmentApp.swift
//  iOSAssignment
//
//  Created by Yogi on 19/04/24.
//

import SwiftUI
import SwiftData

@main
struct iOSAssignmentApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Restaurant.self,
            Cuisine.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RestaurantListView()
        }
        .modelContainer(sharedModelContainer)
    }
    
    
    init() {
        /// print data sheme url so that we can check tables
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
