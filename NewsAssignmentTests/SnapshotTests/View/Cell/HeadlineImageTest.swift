//
//  HeadlineImageTest.swift
//  NewsAssignmentTests
//
//  Created by Jyoti Kumari on 16/01/24.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import NewsAssignment

final class HeadlineImageTest: XCTestCase {
    func testHeadlineImage() {
        let headlineImage: HeadlineImage = HeadlineImage(imageURL: StringConstant.sampleData.urlToImage)
        assertSnapshots(matching: headlineImage.toViewController(), as: [.image])
    }
}


