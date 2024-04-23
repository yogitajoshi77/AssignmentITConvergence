//
//  StarAverageView.swift
//  iOSAssignment
//
//  Created by Yogi on 21/04/24.
//

import SwiftUI

// This view is used for showing Star with rating
struct StarAverageView: View {
    // MARK: - Variable
    var averageRating: Double
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Image(systemName: "star.fill")
                .font(.system(size: 40))
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
            Text(String(format: "%.1f", averageRating))
                .foregroundColor(.yellow)
                .font(.system(size: 12))
        }
    }
}
