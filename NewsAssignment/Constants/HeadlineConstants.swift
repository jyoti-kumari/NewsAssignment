//
//  HeadlineConstants.swift
//  NewsAssignment
//
//  Created by Jyoti Kumari on 16/01/24.
//

struct StringConstant {
    static let title: String = "Headlines"
    static let factsLoadFail: String = "Headlines Loading Failed"
    static let defaultErrorMessage: String = "System Error"
    static let sampleData = HeadlineData(id: "1", sourceName: "NDTV News", title: "CJI Chandrachud's folded hand gesture as PM lauds Supreme Court for this move - Hindustan Times", url: "https://www.barandbench.com/news/bharatiya-nyaya-sanhita-2023-changes-and-highlights", urlToImage: "https://gumlet.assettype.com/barandbench%2F2023-08%2F4e3c1f82-7235-4607-a1f5-7966aacc6656%2FDELHI__WEB_PAGE_1600x900yut.jpg?w=1200&auto=format%2Ccompress&ogImage=true&enlarge=true", publishedAt: "2023-08-15T05:19:50Z", content: "Terrorist act\r\nIn another first, a 'terrorist act' has been defined under the code.\r\nAs per Section 111(1), a person is considered to have committed a terrorist act if they intentionally engage in an… [+648 chars]")
}

struct URLConstants {
    static let apiKey = "52014e821d834f8687edf6ca990cbb71"
    static let baseURL = "https://newsapi.org/v2/"
    static let topHeadlines = "top-headlines"
    static let additionalHeadersKey = "Content-Type"
    static let additionalHeaders = "application/json"
}

