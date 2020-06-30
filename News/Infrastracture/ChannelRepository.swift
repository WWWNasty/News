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
        let channel = realm.objects(Channel.self).filter("urlToSource = '\(urlToSource)'")
        try! realm.write {
            realm.delete(channel)
        }

    }

    func add(title: String, description: String, id: String, urlToSource: String) {
        do {
            let newData = Channel()

            newData.id = id.replacingOccurrences(of: "https://", with: "")
                    .replacingOccurrences(of: "http://", with: "")
            newData.descriptionChannel = description
            newData.name = title
            newData.urlToSource = id
            try realm.write({
                realm.add(newData)
                print("success")
            })
        } catch {
            print(error.localizedDescription)
        }
    }
}