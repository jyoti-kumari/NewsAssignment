//
//  HeadlineRepository.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

import Foundation
import PromiseKit

protocol HeadlineRepositoryProtocol {
    func getHeadlines() -> Promise<[HeadlineData]>
}

final internal class HeadlineRepository: HeadlineRepositoryProtocol {
    
    private let apiService: HeadlineService
    
    internal init(apiService: HeadlineService) {
        self.apiService = apiService
    }
    
    func getHeadlines() -> Promise<[HeadlineData]> {
        return apiService.getHeadlines()
    }
}


