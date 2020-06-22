//
// Created by Настя on 11.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import Foundation
import SwiftUI

struct SourceArticle: Codable {
    var id: String?
    var name: String
}

struct ArticleAPIResponse: Codable, Identifiable {
    var id: String
    var source: SourceArticle
    var title: String
    var description: String
    var urlToImage: String?

    enum CodingKeys: String, CodingKey {
        case source, title, description, urlToImage
        //for id field "url" will be taken
        case id = "url"
    }
}

struct NewsAPIResponse: Codable {
    var status: String
    var totalResults: Int
    var articles: [ArticleAPIResponse]
}

struct SourceChannel:Codable, Identifiable{
    var id: String
    var name: String
    var description: String

    enum CodingKeys: String, CodingKey {
        case name, description
        //for id field "url" will be taken
        case id = "url"
    }
}

struct ChannelsAPIResponse: Codable {
    var status: String
    var sources: [SourceChannel]
}