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

    var body: some View {
        NavigationView {

            VStack {
                NavigationLink(destination: AllNews(articles: self.articles)) {
                    Text("News")
                }

                List(favoriteChannels) { channel in
                    VStack {
                        NewsChannel(isFavourite: true, title: channel.name, description: channel.descriptionChannel, id: channel.id, urlToSource: channel.urlToSource)
                    }
                }
            }.navigationBarTitle("Favourite channels")
        }.onAppear {
            self.favoriteChannels = ChannelService(realmService: RealmService()).getFavoriteChannels()
        }
    }
}


struct secondViewTab_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
