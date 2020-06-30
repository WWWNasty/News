//
// Created by Настя on 07.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import SwiftUI
import Foundation

struct SearchInAllNews: View {
    @State private var search = ""
    @State var articles: [ArticleAPIResponse] = []
    @Environment(\.imageCache) var cache: ImageCache

    let newsApiService: NewsApiServiceProtocol
    init(newsApiService: NewsApiServiceProtocol){
        self.newsApiService = newsApiService
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $search, onChangeFunction: { (text: String) in
                    if (!self.search.isEmpty) {
                        self.newsApiService.getArticles(searchString: self.search) { (articles) in
                            self.articles = articles
                        }
                    }
                })

                List(articles) { (article: ArticleAPIResponse) in
                    NewsList(title: article.title, description: article.description, cache: self.cache, urlToImage: article.urlToImage)
                }
            }.navigationBarTitle("Search")
        }.gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
    }
}

struct thirdViewTab_Previews: PreviewProvider {
    static var previews: some View {
        SearchInAllNews(newsApiService: NewsApiService())
    }
}

