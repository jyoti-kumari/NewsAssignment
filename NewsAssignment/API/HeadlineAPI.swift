//
//  HeadlineAPI.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

import Foundation

struct HeadlineEnvironment: Environment {
    let baseURL: String = URLConstants.baseURL
}

extension APISetUp {
    static var dev: Self {
        APISetUp(environment: HeadlineEnvironment())
    }
}


