//
//  AddReviewView.swift
//  iOSAssignment
//
//  Created by Yogi on 20/04/24.
//

import SwiftData
import SwiftUI

struct AddReviewView: View {
    
    // MARK: - Properties
    @State var selectedRestaurant: Restaurant
    @State var ratingStar: Double = 0.0
    @State var date: Date = Date.now
    @State var ratingString: String = ""
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
        
    // MARK: - Init Method
    init(selectedRestaurant: Restaurant) {
        self.selectedRestaurant = selectedRestaurant
    }

    // MARK: - Body
    var body: some View {
        VStack {
            // Show Title on the Screen
            Text(StringConstants.addRating)
                .font(.largeTitle)
            // Rating View is used to give rating
            RatingView(maxRating: 5, rating: $ratingStar, starColor: .blue, starRounding: .roundToHalfStar)
                .padding()
            // Select date from DatePicker
            DatePicker(selection: $date, in: ...Date.now, displayedComponents: .date) {
                Text(StringConstants.selectDate)
            }
            // Write review
            TextField(StringConstants.enterReview, text: $ratingString)
                .frame(height: 50)
                .padding([.leading], 20)
                .border(.black, width: 1)
                .autocorrectionDisabled()
            
            // Button is for saving review in DB
            Button(action: {
                withAnimation {
                    let newRating = RestaurantRating(restaurant: selectedRestaurant, rating: ratingStar, date: date, notes: ratingString)
                    selectedRestaurant.ratings?.append(newRating)
                    modelContext.insert(newRating)
                }
                // afte entering review dismiss the screen
                dismiss()
            }) {
                HStack{
                    Spacer()
                    Text(StringConstants.submit)
                        .padding()
                        .foregroundColor(.white)
                        
                    Spacer()
                }
                .background(.black)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
            }
            .padding(.top, 20)
            Spacer()
        }
        .padding(.all, 20)
    }
}
