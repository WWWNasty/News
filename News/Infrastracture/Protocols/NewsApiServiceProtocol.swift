//
// Created by Настя on 26.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import Foundation

protocol NewsApiServiceProtocol {
    func getArticles(searchString: String, completion: @escaping ([ArticleAPIResponse]) -> ())
    func getFavouriteArticles(domains: String, completion: @escaping ([ArticleAPIResponse]) -> ())
    func getChannels(completion: @escaping ([ChannelViewModel]) -> ())
}