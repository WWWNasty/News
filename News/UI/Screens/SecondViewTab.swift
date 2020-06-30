//
// Created by Настя on 07.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import RealmSwift
import SwiftUI
import UIKit
import Foundation

struct FavouritesNewsChannels: View {
    @State var articles: [ArticleAPIResponse] = []
    @State var favoriteChannels: [ChannelViewModel] = []
    let channelService: ChannelService
    let allNews: AllNews

    init(channelService: ChannelService, allNews: AllNews){
        self.channelService = channelService
        self.allNews = allNews
    }

    var body: some View {
        NavigationView {

            VStack {
                NavigationLink(destination: allNews) {
                    Text("News")
                }

                List(favoriteChannels) { channel in
                    VStack {
                        NewsChannel(isFavourite: true, title: channel.name, description: channel.descriptionChannel, id: channel.id, urlToSource: channel.urlToSource)
                    }
                }
            }.navigationBarTitle("Favourite channels")
        }.onAppear {
            self.favoriteChannels = self.channelService.getFavoriteChannels()
        }
    }
}


struct secondViewTab_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesNewsChannels(channelService: ChannelService(realmService: ChannelRepository(realm: try! Realm())),
                allNews: AllNews(articleService: ArticleService(realmService: ChannelRepository(realm: try! Realm()), api: NewsApiService())))
    }
}
