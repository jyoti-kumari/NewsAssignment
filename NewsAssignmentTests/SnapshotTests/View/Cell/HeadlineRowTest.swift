//
//  HeadlineRowTest.swift
//  NewsAssignmentTests
//
//  Created by Jyoti Kumari on 16/01/24.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import NewsAssignment

final class HeadlineRowTest: XCTestCase {
    func testHeadlineRow() {
        let headlineRow: HeadlineRow = HeadlineRow(headline: StringConstant.sampleData)
        assertSnapshots(matching: headlineRow.toViewController(), as: [.image])
    }
}

