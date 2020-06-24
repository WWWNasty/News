//
// Created by Настя on 07.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import RealmSwift
import SwiftUI
import Foundation

struct AllNewsChannels: View {
    @State var channels: [SourceChannel]
    @State var favouriteChannels: Results<Channel>?


    var body: some View {
        NavigationView {
            VStack {

                List(channels) { channel in

                    NewsChannel(isFavourite: self.favouriteChannels?.contains { favouriteChannel in
                        //todo change to id
                        channel.id == favouriteChannel.urlToSource
                    } ?? false, title: channel.name, description: channel.description, id: channel.id, urlToSource: channel.id)

                }.onAppear() {
                    self.favouriteChannels = ChannelService().getAllChannels {
                        channels in
                        self.channels = channels
                    }

                }
            }.navigationBarTitle("Channels")
        }
    }
}

struct firstViewTab_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
