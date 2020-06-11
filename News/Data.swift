//
// Created by Настя on 10.06.2020.
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
    var urlToImage: URL

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

class Api {
    var key = "8fcacb54503448489324371c70936f9c"

    func getArticles(completion: @escaping ([Article]) -> ()) {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=Bitcoin&apiKey=\(key)") else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
                    let newsAPIResponse = try! JSONDecoder().decode(NewsAPIResponse.self, from: data!)
                    DispatchQueue.main.async {
                        completion(newsAPIResponse.articles)
                    }
                }
                .resume()
    }
}
