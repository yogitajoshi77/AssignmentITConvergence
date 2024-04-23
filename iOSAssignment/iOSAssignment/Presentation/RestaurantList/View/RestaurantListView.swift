//
//  RestaurantListView.swift
//  iOSAssignment
//
//  Created by Yogi on 19/04/24.
//

import SwiftUI
import SwiftData

struct RestaurantListView: View {
    // MARK: - Properties
    @Environment(\.modelContext) private var modelContext
    @State var viewModel: RestaurantListVM
    @Query var items: [Restaurant]
    
    // MARK: - Init method
    init(viewModel: RestaurantListVM) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    NavigationLink {
                        // viewModel and selected restaurant as dependancy injection
                        RestaurantRatingView(viewModel: RestaurantRatingVM(), selectedRestaurant: item)
                    } label: {
                        RestaurantView(restaurant: item)
                        // .swipeActions will provide swipe functionality in list and we can add Buttons on it
                            .swipeActions(edge: .trailing) {
                                // Delete button for deleting item from the restaurant list
                                Button(StringConstants.delete) {
                                    self.deleteItems(index: index)
                                }
                                .tint(.red)
                                
                                // Edit button for editing item from the restaurant list
                                Button(StringConstants.edit) {
                                    for item in item.cuisineType {
                                        viewModel.selections.append(item.cuisinStr)
                                    }
                                    viewModel.showingEditRestaurantSheet = true
                                }
                                .tint(.green)
                                
                            }
                            // .sheet will present sheet for editing restaurant
                            .sheet(isPresented: $viewModel.showingEditRestaurantSheet) {
                                AddRestaurantView(restaurant: item, selections: viewModel.selections)
                            }
                    }
                }
            }
            .overlay(Group {
                if items.isEmpty {
                    Spacer()
                    Text(StringConstants.noRestaurantAvailable)
                    Spacer()
                }
            })
            // .navigationTitle will give title to your screen
            .navigationTitle(StringConstants.restaurantList)
            // .toolbar will give button on navigation bar
            .toolbar {
                ToolbarItem {
                    // Add button for adding restaurant in restaurant list
                    Button(StringConstants.addItem, systemImage: ImageNameConstants.plus) {
                        viewModel.showingSheet.toggle()
                    }
                    .sheet(isPresented: $viewModel.showingSheet) {
                        AddRestaurantView()
                    }
                    
                }
            }
            .onAppear {
                self.saveCuisineDta()
            }
        }
    }
}

// extension made to put all private method in one place
extension RestaurantListView {
    
    /// This function is used to check that if cuisine are loded or not
    /// - Returns: [Cuisine]
    private func loadCuisine() -> [Cuisine] {
        var items: [Cuisine] = []
        let fetchDescriptor = FetchDescriptor<Cuisine>(sortBy: [SortDescriptor(\Cuisine.cuisinStr)])
        do {
            items = try modelContext.fetch(fetchDescriptor)
            // print(items)
        } catch {
            // Error handling here or make the function throw
        }
        return items
    }
    
    
    /// This func is used for delete item in Restaurant list
    /// - Parameter index: pass integer index
    private func deleteItems(index: Int) {
        withAnimation {
            modelContext.delete(items[index])
        }
    }
    
    /// This function is used for saving cuisin first time in DB, if there is any new entry in cuisinArr then only we insert data through modelContext otherwise not
    private func saveCuisineDta() {
        let cuisinArr = [StringConstants.chinees, StringConstants.italian, StringConstants.indian, StringConstants.thai]
        for item in cuisinArr {
            let newItem = Cuisine(cuisinStr: item)
            if loadCuisine().contains(where: { cuisine in
                cuisine.cuisinStr == item
            }) {
                // don't save into Db
            } else {
                modelContext.insert(newItem)
            }
        }
    }
}
