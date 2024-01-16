//
//  HeadlineDTO.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

struct HeadlineDTO: Decodable {
    let status: String
    let totalResults: Int?
    let articles: [HeadlineItemDTO]?
}

struct HeadlineItemDTO: Decodable {
    let source: HeadlineSourceDTO
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct HeadlineSourceDTO: Decodable {
    let id: String?
    let name: String?
}

