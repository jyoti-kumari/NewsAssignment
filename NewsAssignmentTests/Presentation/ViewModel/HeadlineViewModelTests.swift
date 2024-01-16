//
//  HeadlineViewModelTests.swift
//  NewsAssignmentTests
//
//  Created by Jyoti Kumari on 16/01/24.
//

import XCTest
import PromiseKit
@testable import NewsAssignment

final class HeadlineViewModelTests: XCTestCase {
    
    var viewModel: HeadlineViewModel!
    
    class MockFetchNewsHeadlinesUseCase: GetHeadlinesUseCaseProtocol {
        var newsArticles: [HeadlineData]?
        var error: Error?
        
        func execute() -> Promise<[HeadlineData]> {
            if let error = error {
                return Promise(error: error)
            }
            let response = newsArticles ?? []
            return Promise.value(response)
        }
    }
    
    override func setUp() {
        viewModel = HeadlineViewModel(getHeadlinesUseCaseProtocol: MockFetchNewsHeadlinesUseCase())
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    // Test fetching news articles successfully
    func testFetchNewsArticlesSuccess() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch news articles successfully")
        
        let mockResponse = MockResponseManager.loadMockResponse(ofType: HeadlineDTO.self, from: "News")
        
        if let useCase = viewModel.getHeadlinesUseCaseProtocol as? MockFetchNewsHeadlinesUseCase {
            useCase.newsArticles = HeadlineMapper.getHeadline(dataApiResponse: mockResponse)
        }
        // When
        let promise: Promise<[HeadlineData]> = viewModel.getHeadlinesUseCaseProtocol.execute()
        
        promise.done { response in
            // Then
            XCTAssertNotNil(self.viewModel.headlines)
            expectation.fulfill()
        }.catch { error in
            XCTFail("Error should not occur: \(error)")
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // Test fetching news articles with an error
    func testFetchNewsArticlesError() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch news articles with error")
        
        let mockError = NSError(domain: "TestErrorDomain", code: 123, userInfo: nil)
        if let useCase = viewModel.getHeadlinesUseCaseProtocol as? MockFetchNewsHeadlinesUseCase {
            useCase.error = mockError
        }
        // When
        let promise: Promise<[HeadlineData]> = viewModel.getHeadlinesUseCaseProtocol.execute()
        
        promise.done { _ in
            XCTFail("Promise should not fulfill")
        }.catch { error in
            // Then
            XCTAssertEqual(error as NSError, mockError)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)

    }
    
}

