//
//  RestaurantView.swift
//  iOSAssignment
//
//  Created by Yogi on 21/04/24.
//

import SwiftUI

// This view is used as row in Restaurant List
struct RestaurantView: View {
    // MARK: - Properties
    var restaurant: Restaurant
    var isReviewScreen: Bool = false
    
    // MARK: - Body
    var body: some View {
        if isReviewScreen {
            HStack(alignment: .top) {
                StarAverageView.init(averageRating: averageRating())
                    .padding(.leading, 20)
                Text(restaurant.name)
                    .padding(.top, 10)
                Spacer()
            }
        } else {
            HStack {
                HStack(alignment: .top) {
                    StarAverageView.init(averageRating: averageRating())
                    Text(restaurant.name)
                        .padding(.top, 10)
                    Spacer()
                }
                HStack {
                    Text("\((restaurant.ratings ?? []).count)")
                        .padding(.all, 8)
                        .background(.teal)
                        .clipped()
                        .clipShape(Circle())
                }
            }
        }
    }
}

// extension made to put all private method in one place
extension RestaurantView {
    
    // MARK: - Function for calculating average rating
    /// This method is used for calculating average rating
    /// - Returns: averagare rating in Double
    func averageRating() -> Double {
        var averageRating = 0.0
        guard let rating = restaurant.ratings, rating.isEmpty == false else { return 0.0 }
        for ratingItem in rating {
            averageRating += ratingItem.rating
        }
        return averageRating / Double(rating.count)
    }
}
