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
            
            List(news) { news in//filter!!!!!!!!!
                VStack {
                    NewsList(title: news.name, description: news.description)
                }
            }
        }.navigationBarTitle("Search")
    }
}

struct thirdViewTab_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
