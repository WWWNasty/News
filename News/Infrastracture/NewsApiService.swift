//
// Created by Настя on 10.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import Foundation
import SwiftUI

class Api {
    var key = "8fcacb54503448489324371c70936f9c"

    func getArticles(searchString: String, completion: @escaping ([Article]) -> ()) {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=\(searchString)&apiKey=\(key)") else {
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

    func getChannels(completion: @escaping ([SourceChannel]) -> ()){
        guard let urlChannels = URL(string: "https://newsapi.org/v2/sources?apiKey=\(key)") else {
            return
        }
        URLSession.shared.dataTask(with: urlChannels) { (data, _, _) in
                    let channelAPIResponse = try! JSONDecoder().decode(ChannelsAPIResponse.self, from: data!)
                    DispatchQueue.main.async {
                        completion(channelAPIResponse.sources)
                    }                }
                .resume()
    }
}
