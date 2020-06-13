//
// Created by Настя on 11.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import Foundation
import SwiftUI

struct Source: Codable {
    var id: String?
    var name: String
}

struct Article: Codable, Identifiable {
    var id: String
    var source: Source
    var title: String
    var description: String
    var urlToImage: String?

    enum CodingKeys: String, CodingKey {
        case source, title, description, urlToImage
        //for id field "url" will be taken
        case id = "url"
    }
    //var publishedAt:
}

struct NewsAPIResponse: Codable {
    var status: String
    var totalResults: Int
    var articles: [Article]
}
