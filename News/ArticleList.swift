//
// Created by Настя on 10.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import SwiftUI
import Foundation

struct ArticleList: View{
    @State var articles: [Article] = []

    var body: some View{
        List(articles) { (article: Article) in
            Text(article.description)
        }.onAppear {
                    Api().getArticles{ (articles) in
                        self.articles = articles
                    }
                }
    }
}

struct ArticleList_Previews: PreviewProvider {
    static var previews: some View {
        ArticleList()
    }
}
