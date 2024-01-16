//
//  HeadlineDetailImageTest.swift
//  NewsAssignmentTests
//
//  Created by Jyoti Kumari on 16/01/24.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import NewsAssignment

final class HeadlineDetailImageTest: XCTestCase {
    func testHeadlineDetailImage() {
        let headlineDetailImage: HeadlineDetailImage = HeadlineDetailImage(imageURL: StringConstant.sampleData.urlToImage)
        assertSnapshots(matching: headlineDetailImage.toViewController(), as: [.image])
    }
}
