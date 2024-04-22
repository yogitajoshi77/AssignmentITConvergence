//
//  MultipleSelectionRow.swift
//  iOSAssignment
//
//  Created by Yogi on 21/04/24.
//

import SwiftUI

struct MultipleSelectionRow: View {
    // MARK: - Properties
    var title: String
    var isSelected: Bool
    var action: () -> Void

    // MARK: - Body
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
