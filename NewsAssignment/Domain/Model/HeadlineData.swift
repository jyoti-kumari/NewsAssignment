//
//  HeadlineData.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

import Foundation

struct HeadlineData {
    let sourceName: String
    let title: String
    let url: String
    let urlToImage: String
    let publishedDate: String
    let content: String
    
    init(id: String?, sourceName: String?, title: String?, url: String?, urlToImage: String?, publishedAt: String?, content: String?) {
        self.sourceName = sourceName.orEmpty()
        self.title = title.orEmpty()
        self.url = url.orEmpty()
        self.urlToImage =  urlToImage.orEmpty()
        let date = publishedAt?.formattedDate()
        self.publishedDate = date.orEmpty()
        self.content = content.orEmpty()
    }
}

