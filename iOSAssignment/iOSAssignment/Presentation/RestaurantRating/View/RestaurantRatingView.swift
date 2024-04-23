//
//  RestaurantRatingView.swift
//  iOSAssignment
//
//  Created by Yogi on 19/04/24.
//

import SwiftUI
import SwiftData

struct RestaurantRatingView: View {
    
    // MARK: - Properties
    @State var viewModel: RestaurantRatingVM
    @State var selectedRestaurant: Restaurant
    
    // MARK: - Init method
    init(viewModel: RestaurantRatingVM, selectedRestaurant: Restaurant) {
        self.viewModel = viewModel
        self.selectedRestaurant = selectedRestaurant
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            RestaurantView(restaurant: selectedRestaurant, isReviewScreen: true)
                .padding(.bottom, 20)
                .padding(.top, 4)
                .background(Color.teal)
            if let ratingArr = selectedRestaurant.ratings, ratingArr.isEmpty == false {
                List {
                    ForEach(Array(ratingArr.enumerated()), id: \.offset) { index, item in
                        ReviewView(ratingObj: item)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets())
                    }
                }.listStyle(.plain)
                    .padding(.all, 20)
            } else {
                Spacer()
                Text(StringConstants.noRatingAvailable)
                Spacer()
            }
        }
        .navigationTitle("\(StringConstants.ratingView) (\(selectedRestaurant.ratings?.count ?? 0))")
        .navigationBarTitle("", displayMode: .inline) // used for navigation title to top of the screen
        .toolbarRole(.editor) // used for hide the navigationbar back button title
        .toolbar {
            ToolbarItem {
                Button(StringConstants.addRating, systemImage: ImageNameConstants.plus) {
                    viewModel.showingSheet.toggle()
                }
                .sheet(isPresented: $viewModel.showingSheet) {
                    AddReviewView(selectedRestaurant: selectedRestaurant)
                }
                
            }
        }
    }
}

struct ReviewView: View {
    // MARK: - Variables
    var ratingObj: RestaurantRating
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(ratingObj.date.dateString("dd MMM yyyy"))")
            HStack(alignment: .top) {
                StarAverageView.init(averageRating: ratingObj.rating)
                Text(ratingObj.notes)
                    .padding(.top, 8)
                Spacer()
            }
            Divider()
        }
    }
}
