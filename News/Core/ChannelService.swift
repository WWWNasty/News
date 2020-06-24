//
// Created by Настя on 22.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import RealmSwift
import Foundation

class ChannelService {

    func makeFavourite(title: String, description: String, id: String, urlToSource: String, isFavourite: inout Bool) {
        let config = Realm.Configuration(schemaVersion :1)
        do{
            let realm = try Realm(configuration: config)
            let newData = Channel()
            let channel = realm.objects(Channel.self).filter("urlToSource = '\(urlToSource)'")

            if isFavourite {
                try! realm.write {
                    realm.delete(channel)
                }

            } else {
                newData.id = id.replacingOccurrences(of: "https://", with: "")
                        .replacingOccurrences(of: "http://", with: "")
                newData.descriptionChannel = description
                newData.name = title
                newData.urlToSource = id
                try realm.write({
                    realm.add(newData)
                    print("success")
                })
            }
        }
        catch{
            print(error.localizedDescription)
        }
        isFavourite.toggle()

    }

    func getFavouriteChannels() -> Array<Channel> {
        let config = Realm.Configuration(schemaVersion: 1)
        do {
            let realm = try Realm(configuration: config)
            let favouriteChannels = Array(realm.objects(Channel.self))
            return favouriteChannels
        } catch {
            print(error.localizedDescription)
            let realm = try! Realm()
            return Array(realm.objects(Channel.self).filter(NSPredicate(value: false)))
        }

    }

    func getAllChannels(allChannels: @escaping ([SourceChannel]) -> ()) -> Results<Channel> {

        Api().getChannels(completion: allChannels)

        let config = Realm.Configuration(schemaVersion :1)
        do {
            let realm = try Realm(configuration: config)
            let favouriteChannels = realm.objects(Channel.self)
            return favouriteChannels
        }
        catch{
            print(error.localizedDescription)
            let realm = try! Realm()
            return realm.objects(Channel.self).filter(NSPredicate(value: false))
        }
    }

}