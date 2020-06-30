//
// Created by Настя on 07.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import RealmSwift
import SwiftUI
import Foundation

struct AllNewsChannels: View {
    @State var channels: [SourceChannel] = []
    @State var favoriteChannels: [ChannelViewModel] = []
    let newsApiService: NewsApiServiceProtocol
    let channelService: ChannelService

    init(newsApiService: NewsApiServiceProtocol, channelService: ChannelService) {
        self.newsApiService = newsApiService
        self.channelService = channelService
    }

    var body: some View {
        NavigationView {
            VStack {
                List(channels) { channel in
                    NewsChannel(isFavourite: self.favoriteChannels.contains { favouriteChannel in
                        channel.id == favouriteChannel.urlToSource
                    }, title: channel.name, description: channel.description, id: channel.id, urlToSource: channel.id)
                }
            }.navigationBarTitle("Channels")
        }
                .onAppear {
                    self.newsApiService.getChannels { channels in
                        self.channels = channels
                    }
                    self.favoriteChannels = self.channelService.getFavoriteChannels()
                }
    }
}

//struct firstViewTab_Previews: PreviewProvider {
//    static var previews: some View {
//        AllNewsChannels(newsApiService: NewsApiService(), channelService: ChannelService(realmService: ChannelRepository(realm: try! Realm())))
//    }
//}
