//
//  ContentView.swift
//  News
//
//  Created by Настя on 06.06.2020.
//  Copyright © 2020 Настя. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var selection = 0
    @State var articles: [ArticleAPIResponse] = []
    @State var channels: [SourceChannel] = []

    var body: some View {

        TabView(selection: $selection) {

            //первая таба
            AllNewsChannels(channels: channels).tabItem {
                        VStack {
                            Image(systemName: "list.dash").font(.system(size: 16, weight: .black))
                            Text("All channels")
                        }
                    }
                    .tag(0)

//            //второй таб
//            FavouritesNewsChannels(channels: fakeData).tabItem {
//                        VStack {
//                            Image(systemName: "star.fill").font(.system(size: 16, weight: .black))
//                            Text("Favourite channels")
//                        }
//                    }
//                    .tag(1)

            //третья таба
            SearchInAllNews(articles: articles).tabItem {
                        VStack {
                            Image(systemName: "magnifyingglass").font(.system(size: 16, weight: .black))
                            Text("Search news")
                        }
                    }
                    .tag(1)
            

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

