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
        channels = channels.filter{ channel in channel.urlToSource == urlToSource}
    }

    func add(title: String, description: String, id: String, urlToSource: String) {
        let channel = Channel()

        channel.name = title
        channel.descriptionChannel = description
        channel.id = id
        channel.urlToSource = urlToSource

        channels.append(channel)
    }


}