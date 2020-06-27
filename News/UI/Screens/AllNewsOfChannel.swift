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
                    ArticleService(realmService: ChannelRepository(realm: try! Realm()), api: NewsApiService()).getAllFavouriteArticles {
                        (articles) in self.articles = articles
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
