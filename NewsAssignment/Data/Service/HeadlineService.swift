//
//  HeadlineService.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

import Foundation
import PromiseKit

class HeadlineService {
    
    private let apiService: ServiceProtocol
    private let api: APISetUp
    
    internal init(apiService: ServiceProtocol, api: APISetUp) {
        self.apiService = apiService
        self.api = api
    }
    
    func getHeadlines() -> Promise<[HeadlineData]> {
        return Promise { seal in
            self.apiService.request(getRequest(), responseType: HeadlineDTO.self)
                .done { response in
                    seal.fulfill(HeadlineMapper.getHeadline(dataApiResponse: response))
                }
                .catch { error in
                    seal.reject(error)
                }
        }
    }
    
    fileprivate func getRequest() -> BaseRequest {
        let headlineRequest = BaseRequest()
        headlineRequest.requestQueryParam = "country=in"
        headlineRequest.requestURL = api.headlinesURL.absoluteString
        return headlineRequest
    }
}


