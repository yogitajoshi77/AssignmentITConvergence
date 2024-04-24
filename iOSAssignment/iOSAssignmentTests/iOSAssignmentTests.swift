//
//  iOSAssignmentTests.swift
//  iOSAssignmentTests
//
//  Created by Yogi on 23/04/24.
//

import XCTest
import SwiftData

@testable import iOSAssignment

final class iOSAssignmentTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// Date should be in correct formate
    func testDateFromStringSuccess() {
        let dateString = "2023-04-01"
        let date = Date().dateFormatter().date(from: dateString)
        XCTAssertNotNil(date, "Date should not be nil")
    }
    
    /// Date formatter failed to parse dateString
    func testDateFromStringFailure() {
        let dateString = "04-01-2023"
        let date = Date().dateFormatter().date(from: dateString)
        XCTAssertNotNil(date, "Date should not be nil")
    }
}
