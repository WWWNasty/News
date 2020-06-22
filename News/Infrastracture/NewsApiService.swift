//
// Created by Настя on 10.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import Foundation
import SwiftUI

class Api {
    var key = "8fcacb54503448489324371c70936f9c"

    func getArticles(searchString: String, completion: @escaping ([ArticleAPIResponse]) -> ()) {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=\(searchString)&apiKey=\(key)") else {
            return
        }
        let cache = URLCache.shared
        let request = URLRequest(url: url)
        //в случае ошибки  доставать из кеша
        URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        if let data = cache.cachedResponse(for: request)?.data {
                            let newsAPIResponse = try! JSONDecoder().decode(NewsAPIResponse.self, from: data)
                            DispatchQueue.main.async {
                                completion(newsAPIResponse.articles)
                            }
                        }
                    }
                    else {
                        let newsAPIResponse = try! JSONDecoder().decode(NewsAPIResponse.self, from: data!)
                        //добавлять новые записи в кеш
                        let cachedData = CachedURLResponse(response: response!, data: data!)
                        cache.storeCachedResponse(cachedData, for: request)
                        DispatchQueue.main.async {
                            completion(newsAPIResponse.articles)
                        }
                    }
                }
                .resume()
    }

    func getFavouriteArticles(domains: String, completion: @escaping ([ArticleAPIResponse]) -> ()) {
        if domains.isEmpty {
            return
        }
        guard let urlFavouriteArticles = URL(string: "https://newsapi.org/v2/everything?domains=\(domains)&apiKey=\(key)") else {
            return
        }
        let cache = URLCache.shared
        let request = URLRequest(url: urlFavouriteArticles)
        URLSession.shared.dataTask(with: urlFavouriteArticles) { (data, response, error) in
                    if error != nil {
                        if let data = cache.cachedResponse(for: request)?.data{
                            let newsFavouriteAPIResponse = try! JSONDecoder().decode(NewsAPIResponse.self, from: data)
                            DispatchQueue.main.async {
                                completion(newsFavouriteAPIResponse.articles)
                            }
                        }
                    }
                    else {
                        let newsFavouriteAPIResponse = try! JSONDecoder().decode(NewsAPIResponse.self, from: data!)
                        let cachedData = CachedURLResponse(response: response!, data: data!)
                        cache.storeCachedResponse(cachedData, for: request)
                        DispatchQueue.main.async {
                            completion(newsFavouriteAPIResponse.articles)
                        }
                    }

                }
                .resume()
    }

    // новости из нескольких доменов https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=8f

    func getChannels(completion: @escaping ([SourceChannel]) -> ()) {

        guard let urlChannels = URL(string: "https://newsapi.org/v2/sources?apiKey=\(key)") else {
            return
        }
        URLSession.shared.dataTask(with: urlChannels) { (data, _, error) in
                    if error != nil{
                        return
                    } else {
                        let channelAPIResponse = try! JSONDecoder().decode(ChannelsAPIResponse.self, from: data!)
                        DispatchQueue.main.async {
                            completion(channelAPIResponse.sources)
                        }
                    }
                }
                .resume()
    }
}
