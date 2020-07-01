//
// Created by Настя on 11.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import RealmSwift
import SwiftUI
import Foundation

struct NewsChannel: View {
    var channel: ChannelViewModel
    let channelService: ChannelService
    @State var isFavourite: Bool

    init(channelService: ChannelService, channel: ChannelViewModel, isFavorite: Bool) {
        self.channelService = channelService
        self.channel = channel
        self._isFavourite = State(initialValue: isFavorite)
    }


    var body: some View {
        HStack {
            VStack {
                Text(channel.name).bold()
                Text(channel.descriptionChannel)
            }
            Spacer()
//todo isFavourite вынести во вьюмодель
            Button(action: {
                self.isFavourite = self.channelService.makeFavourite(channel: self.channel, isFavourite: self.isFavourite)
            }) {
                if isFavourite {
                    Image(systemName: "star.fill").font(.system(size: 16, weight: .regular))
                } else {
                    Image(systemName: "star").font(.system(size: 16, weight: .regular))
                }
            }
        }
    }
}


