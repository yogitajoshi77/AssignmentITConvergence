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
    @Environment(\.modelContext) private var modelContext
    @StateObject var viewModel = RestaurantRatingVM()
    @State var restaurantObj: Restaurant
    
    // MARK: - Body
    var body: some View {
        VStack {
            RestaurantView(restaurant: restaurantObj, isReviewScreen: true)
                .padding(.bottom, 20)
                .padding(.top, 4)
                .background(Color.teal)
            if let ratingArr = restaurantObj.ratings, ratingArr.isEmpty == false {
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
        .navigationTitle("\(StringConstants.ratingView) (\(restaurantObj.ratings?.count ?? 0))")
        .navigationBarTitle("", displayMode: .inline) // used for navigation title to top of the screen
        .toolbarRole(.editor) // used for hide the navigationbar back button title
        .toolbar {
            ToolbarItem {
                Button(StringConstants.addRating, systemImage: "plus") {
                    viewModel.showingSheet.toggle()
                }
                .sheet(isPresented: $viewModel.showingSheet) {
                    AddReviewView(restaurantObj: restaurantObj)
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
                Spacer()
            }
            Divider()
        }
    }
}
