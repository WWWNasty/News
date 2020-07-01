//
// Created by Настя on 26.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import RealmSwift
import Foundation

class ChannelRepositoryMock: ChannelRepositoryProtocol{
    var channels: [Channel]

    init(channels: [Channel]){
        self.channels = channels
    }

    func getAll() -> [Channel] {
        channels
    }

    func delete(urlToSource: String) {
        channels = channels.filter{ channel in channel.urlToSource != urlToSource}
    }

    func add(channel: ChannelViewModel) {
        let newChannel = Channel()

        newChannel.name = channel.name
        newChannel.descriptionChannel = channel.descriptionChannel
        newChannel.id = channel.id
        newChannel.urlToSource = channel.urlToSource

        channels.append(newChannel)
    }


}
