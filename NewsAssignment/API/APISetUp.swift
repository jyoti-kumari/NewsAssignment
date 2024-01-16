//
//  APISetUp.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

import Foundation

struct APISetUp {
    let environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
}

extension APISetUp {
    var headlinesURL: URL { URL(string: (URLConstants.baseURL + URLConstants.topHeadlines))! }
    var moreHeadlinesURL: URL { getURL(path: URLConstants.topHeadlines) }
}

fileprivate extension APISetUp {
    func getURL(path: String) ->  URL {
        URL(string: "\(environment.baseURL)/\(path)")!
    }
}

