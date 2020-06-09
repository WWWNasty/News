//
// Created by Настя on 07.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import SwiftUI
import Foundation

struct SearchInAllNews: View {
    @State private var search = ""
    var news: [NewsData]

    @Environment(\.imageCache) var cache: ImageCache
    var  url = URL(string: "https://www.newsbtc.com/wp-content/uploads/2020/06/bitcoin-crypto-traders-shutterstock_1084365701-1-860x570.jpg")!


    var body: some View {
        NavigationView{
        VStack {
            SearchBar(text: $search)

            List(news.filter { data in data.name.localizedCaseInsensitiveContains(self.search) ||
                    data.description.localizedCaseInsensitiveContains(self.search) }) { (news: NewsData) in   //filter!!!!!!!!!
                VStack {
                    NewsList(title: news.name, description: news.description, cache: self.cache, url: self.url	)
                }
            }
        }.navigationBarTitle("Search")
    }
    }
}

struct thirdViewTab_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

