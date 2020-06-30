//
//  ContentView.swift
//  News
//
//  Created by Настя on 06.06.2020.
//  Copyright © 2020 Настя. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var selection = 2
    @State var articles: [ArticleAPIResponse] = []
    let allNewsChannels: AllNewsChannels
    let favouritesNewsChannels: FavouritesNewsChannels
    let searchInAllNews: SearchInAllNews

    init(allNewsChannels: AllNewsChannels, favouritesNewsChannels: FavouritesNewsChannels, searchInAllNews: SearchInAllNews){
        self.allNewsChannels = allNewsChannels
        self.favouritesNewsChannels = favouritesNewsChannels
        self.searchInAllNews = searchInAllNews
    }

    var body: some View {

        TabView(selection: $selection) {

            //первая таба
            allNewsChannels.tabItem {
                        VStack {
                            Image(systemName: "list.dash").font(.system(size: 16, weight: .black))
                            Text("All channels")
                        }
                    }
                    .tag(0)

            //второй таб
            favouritesNewsChannels.tabItem {
                        VStack {
                            Image(systemName: "star.fill").font(.system(size: 16, weight: .black))
                            Text("Favourite channels")
                        }
                    }
                    .tag(1)

            //третья таба
            searchInAllNews.tabItem {
                        VStack {
                            Image(systemName: "magnifyingglass").font(.system(size: 16, weight: .black))
                            Text("Search news")
                        }
                    }
                    .tag(2)
            

        }
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(allNewsChannels: AllNewsChannels(newsApiService: NewsApiService(), channelService: ChannelService(realmService: ChannelRepository())), favouritesNewsChannels: FavouritesNewsChannels(channelService: ChannelService(realmService: ChannelRepository(realm: Realm()), allNews: AllNews), searchInAllNews: SearchInAllNews())
//    }
//}

