//
// Created by Настя on 07.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import SwiftUI
import Foundation
import RealmSwift

struct AllNews: View {
    @Environment(\.imageCache) var cache: ImageCache
    @State var articles: [ArticleAPIResponse] = []

    var body: some View {
        NavigationView {
            VStack {
                List (articles) { (article: ArticleAPIResponse) in
                    VStack {
                        NewsList(title: article.title, description: article.description, cache: self.cache, urlToImage: article.urlToImage)
                    }
                }.onAppear() {


                    let config = Realm.Configuration(schemaVersion: 1)
                    do {
                        let realm = try Realm(configuration: config)
                        let channelsDomains = realm.objects(Channel.self).map { channel in
                            channel.id
                        }.joined(separator: ",")
                        Api().getFavouriteArticles(domains: channelsDomains) { (articles) in
                            self.articles = articles
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }.navigationBarTitle("List all news")
    }
}


//struct allFavouriteNewsPreviews: PreviewProvider {
//
//    static var previews: some View {
//        AllNews(news: )
//    }
//}
