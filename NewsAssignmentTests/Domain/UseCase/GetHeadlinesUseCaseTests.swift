//
//  GetHeadlinesUseCaseTests.swift
//  NewsAssignmentTests
//
//  Created by Jyoti Kumari on 16/01/24.
//

import XCTest
import PromiseKit
@testable import NewsAssignment

class GetHeadlinesUseCaseTests: XCTestCase {
    
    // Mock HeadlineRepository for testing
    class MockHeadlineRepository: HeadlineRepositoryProtocol {
        var apiResponse: [HeadlineData]?
        var error: Error?
        func getHeadlines() -> PromiseKit.Promise<[HeadlineData]> {
            if let error = error {
                return Promise(error: error)
            }
            if let headlineApiResponse = apiResponse {
                return Promise.value(headlineApiResponse)
            }
            return Promise(error: APIError.noData) // Default to no data
        }
    }
    
    var repository: MockHeadlineRepository!

    override func setUp() {
        super.setUp()
        repository = MockHeadlineRepository()
    }
    
    override func tearDown() {
        repository = nil
        super.tearDown()
    }
    
    // Test fetching headlines successfully
    func testGetHeadlineSuccess() {
        // Given
        guard let mockApiResponse = MockResponseManager.loadMockResponse(ofType: HeadlineDTO.self, from: "News") else {
            return
        }
        repository.apiResponse = HeadlineMapper.getHeadline(dataApiResponse: mockApiResponse)
        
        let useCase = GetHeadlinesUseCase(headlineRepository: repository)
        
        // When
        let expectation = XCTestExpectation(description: "Fetch headlines successfully")
        let promise: Promise<[HeadlineData]> = useCase.execute()
        
        promise.done { response in
            // Then
            XCTAssertEqual(response.count, 3)
            expectation.fulfill()
        }.catch { error in
            XCTFail("Error should not occur: \(error)")
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // Test fetching headlines with an error
    func testGetHeadlineError() {
        // Given
        let mockError = NSError(domain: "TestErrorDomain", code: 123, userInfo: nil)
        repository.error = mockError
        
        let useCase = GetHeadlinesUseCase(headlineRepository: repository)
        
        // When
        let expectation = XCTestExpectation(description: "Fetch headlines with error")
        let promise: Promise<[HeadlineData]> = useCase.execute()
        
        promise.done { _ in
            XCTFail("Promise should not fulfill")
        }.catch { error in
            // Then
            XCTAssertEqual(error as NSError, mockError)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // Test fetching Headline with no data
    func testGetHeadlineNoData() {
        // Given

        let useCase = GetHeadlinesUseCase(headlineRepository: repository)
        
        // When
        let expectation = XCTestExpectation(description: "Fetch headline with no data")
        let promise: Promise<[HeadlineData]> = useCase.execute()
        
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
}
