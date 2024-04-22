//
//  StringExtension.swift
//  iOSAssignment
//
//  Created by Yogi on 20/04/24.
//

import Foundation

extension Date {
    /// For changing the date format
    /// - Parameter format: required format
    /// - Returns: result in string
    func dateString(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
