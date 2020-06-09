//
// Created by Настя on 07.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import SwiftUI
import Foundation

struct SearchInAllNews: View {
    @State private var search = ""
    var news: [NewsData]

    var body: some View {
        VStack {
            SearchBar(text: $search)
            
            List(news.filter { data in data.name.localizedCaseInsensitiveContains(self.search) || data.description.localizedCaseInsensitiveContains(self.search) }) { (news: NewsData) in   //filter!!!!!!!!!
                VStack {
                    NewsList(title: news.name, description: news.description)
//                    .filter {self.search.isEmpty ? true: $0.localizedCaseInsensitiveContains(self.search)}
//
//                    news.filter { oneNews in
//                        list.name.contains { name in
//                            name.localizedCaseInsensitiveContains(self.search)
                     //   }
                }
                //NewsList(title: news.name, description: news.description)
            }
        }.navigationBarTitle("Search")
    }
}

struct thirdViewTab_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
