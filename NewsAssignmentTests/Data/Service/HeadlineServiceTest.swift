//
//  HeadlineServiceTest.swift
//  NewsAssignmentTests
//
//  Created by Jyoti Kumari on 16/01/24.
//

import XCTest
import PromiseKit
@testable import NewsAssignment

class HeadlineServiceTest: XCTestCase {
    var session: MockURLSession!
    
    override func setUp() {
        super.setUp()
        session = MockURLSession()
    }
    
    override func tearDown() {
        session = nil
        super.tearDown()
    }
    
    // Test successful API request
    func testAPIRequestSuccess() {
        // Given
        
        session.data = """
                        {
                          "status": "ok",
                          "totalResults": 38,
                          "articles": [
                            {
                              "source": {
                                "id": null,
                                "name": "NDTV News"
                              },
                              "author": null,
                              "title": "Tiranga Trumps Terror As J&K Independence Day Celebrations See Huge Rush - NDTV",
                              "description": "NDTV.com: India, Business, Bollywood, Cricket, Video and Breaking News",
                              "url": "https://www.ndtv.com/news",
                              "urlToImage": "https://cdn.ndtv.com/common/images/ogndtv.png",
                              "publishedAt": "2023-08-15T06:04:25Z",
                              "content": "Prime Minister Narendra Modi on Tuesday highlighted the importance of regional languages during his Independence Day speech from the ramparts of the iconic Red Fort. Referring to the recent move by t… [+1993 chars]"
                            }]
                        }
            """.data(using: .utf8)
        
        let sessionManager = APIManager(session: session)
        let service = HeadlineService(apiService: sessionManager, api: .test)
        
        // When
        let expectation = XCTestExpectation(description: "API request")
        let promise: Promise<[HeadlineData]> = service.getHeadlines()
        promise.done { response in
            // Then
            XCTAssertNotNil(response)
            expectation.fulfill()
        }.catch { error in
            XCTFail("Error should not occur: \(error)")
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // Test API request failure
    func testAPIRequestFailure() {
        // Given
        let mockError = NSError(domain: "TestErrorDomain", code: 123, userInfo: nil)
        
        session.error = mockError
        
        let sessionManager = APIManager(session: session)
        let service = HeadlineService(apiService: sessionManager, api: .test)
        
        // When
        let expectation = XCTestExpectation(description: "API request")
        let promise: Promise<[HeadlineData]> = service.getHeadlines()
        
        promise.done { _ in
            XCTFail("Promise should not fulfill")
        }.catch { error in
            // Then
            XCTAssertEqual(error as NSError, mockError)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // Test API request with no data
    func testAPIRequestNoData() {
        
        session.data = nil
        
        let sessionManager = APIManager(session: session)
        let service = HeadlineService(apiService: sessionManager, api: .test)
        
        // When
        let expectation = XCTestExpectation(description: "API request with no data")
        let promise: Promise<[HeadlineData]> = service.getHeadlines()
        
        promise.done { _ in
            XCTFail("Promise should not fulfill")
        }.catch { error in
            // Then
            XCTAssertTrue(error is APIError)
            XCTAssertEqual(error as? APIError, APIError.noData)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    // Test API request with decoding error
    func testAPIRequestDecodingError() {
        // Given
        let mockData = """
            {
                "invalidKey": "Test Article"
            }
            """.data(using: .utf8)
        
        session.data = mockData
        
        let sessionManager = APIManager(session: session)
        let service = HeadlineService(apiService: sessionManager, api: .test)
        
        // When
        let expectation = XCTestExpectation(description: "API request with decoding error")
        let promise: Promise<[HeadlineData]> = service.getHeadlines()
        
        promise.done { _ in
            XCTFail("Promise should not fulfill")
        }.catch { error in
            // Then
            XCTAssertTrue(error is APIError)
            XCTAssertEqual(error as? APIError, APIError.decodingError)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}

extension APISetUp {
    static var test: Self {
        APISetUp(environment: HeadlineEnvironment())
    }
}

