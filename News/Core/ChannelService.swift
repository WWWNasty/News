//
// Created by Настя on 22.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import RealmSwift
import Foundation

class ChannelService {

    let realmService: RealmService

    init(realmService: RealmService){
        self.realmService = realmService;
    }

    func makeFavourite(title: String, description: String, id: String, urlToSource: String, isFavourite: inout Bool) {
        if isFavourite {
            realmService.delete(urlToSource: urlToSource)
        } else {
            realmService.add(title: title, description: description, id: id, urlToSource: urlToSource)
        }
        isFavourite.toggle()
    }

    func getFavoriteChannels() -> [ChannelViewModel] {
        let favouriteChannels = realmService.getAll()
        let mapped = favouriteChannels.map{channel in ChannelViewModel(id: channel.id, name: channel.name, descriptionChannel: channel.descriptionChannel, urlToSource: channel.urlToSource)}
        return Array(mapped)
    }

}