//
// Created by Настя on 22.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import RealmSwift
import Foundation

class  ChannelRepository: ChannelRepositoryProtocol {

    var realm: Realm

    init(realm: Realm) {
        self.realm = realm
    }

    func getAll() -> [Channel] {
        let favouriteChannels = realm.objects(Channel.self)
        return Array(favouriteChannels)
    }

    func delete(urlToSource: String) {
        do {
            let channel = realm.objects(Channel.self).filter("urlToSource = '\(urlToSource)'")
            try realm.write {
                realm.delete(channel)
            }
        } catch {
            //TODO возвращать из функции false например и на ui показать, что ошибка
            print(error.localizedDescription)
        }
    }

    func add(channel: ChannelViewModel) {
        do {
            let newData = Channel {
                $0.id = channel.id
                $0.descriptionChannel = channel.descriptionChannel
                $0.name = channel.name
                $0.urlToSource = channel.urlToSource
            }

            try realm.write({
                realm.add(newData)
                print("success")
            })
        } catch {
            //TODO возвращать из функции false например и на ui показать, что ошибка
            print(error.localizedDescription)
        }
    }
}