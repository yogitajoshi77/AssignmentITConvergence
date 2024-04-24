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
//                                    self.deleteItems(index: index)
                                    self.viewModel.deleteItems(items: items, index: index, context: modelContext)
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
                                AddRestaurantView(restaurant: item, selections: viewModel.selections, viewModel: AddRestaurantVM())
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
                        AddRestaurantView(viewModel: AddRestaurantVM())
                    }
                    
                }
            }
            .onAppear {
                self.viewModel.saveCuisineDta(context: modelContext)
//                self.saveCuisineDta()
            }
        }
    }
}
