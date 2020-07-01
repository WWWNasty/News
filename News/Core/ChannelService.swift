//
// Created by Настя on 22.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import RealmSwift
import Foundation

class ChannelService {

    let channelRepository: ChannelRepositoryProtocol

    init(channelRepository: ChannelRepositoryProtocol){
        self.channelRepository = channelRepository
    }


    //TODO 8 собрать в одну вью модель
    func makeFavourite(channel: ChannelViewModel, isFavourite: Bool) -> Bool {
        if isFavourite {
            channelRepository.delete(urlToSource: channel.urlToSource)
        } else {
            //TODO тут тоже передать ее
            channelRepository.add(channel: channel)
        }

        return !isFavourite
    }

    //TODO 0 если есть простой автомапер то заменить на него
    func getFavoriteChannels() -> [ChannelViewModel] {
        let favouriteChannels = channelRepository.getAll()
        let mapped = favouriteChannels.map{channel in ChannelViewModel(
                id: channel.id,
                name: channel.name,
                descriptionChannel: channel.descriptionChannel,
                urlToSource: channel.urlToSource)}
        return Array(mapped)
    }

}