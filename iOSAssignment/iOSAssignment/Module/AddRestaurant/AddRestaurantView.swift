//
//  AddRestaurantView.swift
//  iOSAssignment
//
//  Created by Yogi on 19/04/24.
//

import SwiftUI
import SwiftData

struct AddRestaurantView: View {
    // MARK: - Variables
    @State var resturantName: String = ""
    @State var items: [Cuisine] = []
    @State var selections: [String] = []
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    var restaurant: Restaurant?
    
    // MARK: - Init function
    init(restaurant: Restaurant? = nil, selections: [String] = []) {
        self.restaurant = restaurant
        if let restaurant = restaurant {
            self._resturantName = State(initialValue: restaurant.name)
            self._selections = State(initialValue: selections)
        }
    }

    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(StringConstants.addRestaurant)
                .font(.largeTitle)
            TextField(StringConstants.enterRestaurantName, text: $resturantName)
                .frame(height: 50)
                .padding([.leading], 20)
                .border(.black, width: 1)
                .autocorrectionDisabled()
            
            Text(StringConstants.cuisinList)
                .font(.custom("Helvetica Neue", size: 20))
                .padding(.top, 20)
            List {
                // iterate all cuisine saved in DB
                ForEach(self.items, id: \.self) { item in
                    MultipleSelectionRow(title: item.cuisinStr, isSelected: self.selections.contains(item.cuisinStr)) {
                        if self.selections.contains(item.cuisinStr) {
                            self.selections.removeAll(where: { $0 == item.cuisinStr })
                        }
                        else {
                            self.selections.append(item.cuisinStr)
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                }
            }
            .listStyle(PlainListStyle())
            .frame(height: 200)
            .padding(.horizontal, 12)
            
            // Button action for submitting resturant detail
            Button(action: {
                withAnimation {
                    var selectedCuisin: [UserCuisine] = []
                    for item in selections {
                        selectedCuisin.append(UserCuisine(cuisinStr: item))
                    }
                    if let restaurant = restaurant {
                        // Check if resturant object is already there then it is for editing purpose, no need to write save method, it will bydefault save
                        restaurant.name = resturantName
                        restaurant.cuisineType = selectedCuisin
                    } else {
                        // if restaurant object is nil then it is for creating new restaurant object, need to insert in DB
                        let newItem = Restaurant(name: resturantName, cuisineType: selectedCuisin)
                        modelContext.insert(newItem)
                    }
                }
                dismiss()
            }) {
                HStack{
                    Spacer()
                    Text(StringConstants.submit)
                        .padding()
                        .foregroundColor(.white)
                        
                    Spacer()
                }
                .background(resturantName.isEmpty ? .gray : .black)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
            }
            .disabled(resturantName.isEmpty)
            Spacer()
        }
        .padding(.all, 20)
        .onAppear {
            // load cuisine from DB
            self.loadCuisine()
        }
    }
}

// extension made to put all private method in one place
extension AddRestaurantView {
    /// This function is used to load cuisine
    private func loadCuisine() {
        let fetchDescriptor = FetchDescriptor<Cuisine>(sortBy: [SortDescriptor(\Cuisine.cuisinStr)])
        
        do {
            items = try modelContext.fetch(fetchDescriptor)
        } catch {
             // Error handling here or make the function throw
        }
    }
}

