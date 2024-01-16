//
//  HeadlineViewModel.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

import Foundation

protocol HeadlinesViewModelProtocol: ObservableObject {
    func getHeadlines()
    var headlines: [HeadlineData] { get }
    var errorMessage: String { get }
    var title: String { get }
}

class HeadlineViewModel: HeadlinesViewModelProtocol {
    
    @Published var headlines: [HeadlineData] = []
    var errorMessage: String = ""
    var title: String = StringConstant.title
    
    // MARK: - Dependencies
    
    let getHeadlinesUseCaseProtocol: GetHeadlinesUseCaseProtocol
    
    // MARK: - Initialization
    
    init(getHeadlinesUseCaseProtocol: GetHeadlinesUseCaseProtocol) {
        self.getHeadlinesUseCaseProtocol = getHeadlinesUseCaseProtocol
    }
    
    // MARK: - Public Methods
    func getHeadlines() {
        getHeadlinesUseCaseProtocol.execute()
            .done() { [weak self] data in
                self?.headlines = data
            }
            .catch() { error in
            }
    }
}
