//
//  Request.swift
//  NewsAssignmentTests
//
//  Created by Jyoti Kumari on 16/01/24.
//

import Foundation
@testable import NewsAssignment

struct MockRequest: RequestProtocol {
    var requestQueryParam: String = ""
    var apiKey: String = ""
    var httpMethod: HTTPMethod = .get
    var requestParams: [String: Any]?
    var additionalHeaders: [String: String]?
    let requestURL: String = ""
}


