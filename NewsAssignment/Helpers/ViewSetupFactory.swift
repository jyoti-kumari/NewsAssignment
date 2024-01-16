//
//  ViewSetupFactory.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

import Foundation

class ViewSetupFactory {
    
    static func createHeadlinesListView() -> HeadlineViewModel {
        let headlineService = HeadlineService(apiService: APIManager(), api: .dev)
        let useCaseProtocol = GetHeadlinesUseCase(headlineRepository: HeadlineRepository(apiService: headlineService))
        let viewModelProtocol = HeadlineViewModel(getHeadlinesUseCaseProtocol: useCaseProtocol)
        return viewModelProtocol
    }
    
}

