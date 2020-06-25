//
// Created by Настя on 22.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import RealmSwift
import Foundation

class ArticleService{

    func getAllFavouriteArticles(allArticles: @escaping ([ArticleAPIResponse]) -> ()) {
        let channelsDomains = RealmService().getAll().map { channel in
            channel.id
        }.joined(separator: ",")
        Api().getFavouriteArticles(domains: channelsDomains, completion: allArticles)

    }

}