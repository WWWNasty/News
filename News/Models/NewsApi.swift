//
// Created by Настя on 11.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import Foundation
import SwiftUI

struct SourceArticle: Codable, Equatable {

    static func ==(lhs: SourceArticle, rhs: SourceArticle) -> Bool {
        if lhs.id != rhs.id {
            return false
        }
        if lhs.name != rhs.name {
            return false
        }
        return true
    }

    var id: String?
    var name: String
}

struct ArticleAPIResponse: Codable, Identifiable, Equatable {

    static func ==(lhs: ArticleAPIResponse, rhs: ArticleAPIResponse) -> Bool {
        if lhs.id != rhs.id {
            return false
        }
        if lhs.source != rhs.source {
            return false
        }
        if lhs.title != rhs.title {
            return false
        }
        if lhs.description != rhs.description {
            return false
        }
        if lhs.urlToImage != rhs.urlToImage {
            return false
        }
        return true
    }

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