//
//  HeadlineMapper.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

struct HeadlineMapper {
    static func getHeadline(dataApiResponse: HeadlineDTO?) -> [HeadlineData] {
        guard let dataArticles = dataApiResponse?.articles else {
            return []
        }
        
        return dataArticles.map { dataArticle in
            let domainSourceName = dataArticle.source.name
            let domainTitle = dataArticle.title
            let domainUrl = dataArticle.url
            let domainUrlToImage = dataArticle.urlToImage
            let domainPublishedAt = dataArticle.publishedAt
            let domainContent = dataArticle.content
            let id = dataArticle.source.id
            
            return HeadlineData(id: id, sourceName: domainSourceName,
                               title: domainTitle,
                               url: domainUrl,
                               urlToImage: domainUrlToImage,
                               publishedAt: domainPublishedAt,
                               content: domainContent)
        }
    }
}



