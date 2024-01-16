//
//  HeadlineDetailViewTest.swift
//  NewsAssignmentTests
//
//  Created by Jyoti Kumari on 16/01/24.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import NewsAssignment

final class HeadlineDetailViewTest: XCTestCase {
    func testHeadlineDetailView() {
        let headlineDetailView: HeadlineDetailView = HeadlineDetailView(headlineDetail: StringConstant.sampleData)
        assertSnapshots(matching: headlineDetailView.toViewController(), as: [.image])
    }
}



