//
//  GetHeadlinesUseCase.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

import Foundation
import PromiseKit

protocol GetHeadlinesUseCaseProtocol {
    func execute() -> Promise<[HeadlineData]>
}

class GetHeadlinesUseCase: GetHeadlinesUseCaseProtocol {
    private let headlineRepository: HeadlineRepositoryProtocol
    
    init(headlineRepository: HeadlineRepositoryProtocol) {
        self.headlineRepository = headlineRepository
    }
    
    func execute() -> Promise<[HeadlineData]> {
        return headlineRepository.getHeadlines()
    }
}


