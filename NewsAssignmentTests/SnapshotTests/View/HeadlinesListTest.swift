//
//  HeadlinesListTest.swift
//  NewsAssignmentTests
//
//  Created by Jyoti Kumari on 16/01/24.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import NewsAssignment

final class HeadlinesListTest: XCTestCase {
    func testHeadlinesListView() {
        let headlinesList: HeadlinesList = HeadlinesList(headlines: [StringConstant.sampleData])
        assertSnapshots(matching: headlinesList.toViewController(), as: [.image])
    }
}



