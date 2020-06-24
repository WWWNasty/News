//
// Created by Настя on 22.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import RealmSwift
import Foundation

class ArticleService{

    func getAllFavouriteArticles(allArticles: @escaping ([ArticleAPIResponse]) -> ()) {
        let config = Realm.Configuration(schemaVersion: 1)
        do {
            let realm = try Realm(configuration: config)
            let channelsDomains = realm.objects(Channel.self).map { channel in
                channel.id
            }.joined(separator: ",")
            Api().getFavouriteArticles(domains: channelsDomains, completion: allArticles)
        } catch {
            print(error.localizedDescription)
        }
    }

}