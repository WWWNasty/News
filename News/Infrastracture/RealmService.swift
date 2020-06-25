//
// Created by Настя on 22.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import RealmSwift
import Foundation

class RealmService {

    func realmConfiguration() throws -> Realm {
        let config = Realm.Configuration(schemaVersion: 1)
        let realm = try Realm(configuration: config)

        return realm
    }

    func getAll()-> Results<Channel>{
        do {
            let realm = try realmConfiguration()
            let favouriteChannels = realm.objects(Channel.self)
            return favouriteChannels
        }
        catch{
            print(error.localizedDescription)
            let realm = try! Realm()
            return realm.objects(Channel.self).filter(NSPredicate(value: false))
        }
    }

    func delete(urlToSource: String){
        do {
            let realm = try realmConfiguration()
            let channel = realm.objects(Channel.self).filter("urlToSource = '\(urlToSource)'")
            try! realm.write {
                realm.delete(channel)
            }
        }
        catch{
            print(error.localizedDescription)
        }
    }

    func add(title: String, description: String, id: String, urlToSource: String){
        do {
            let realm = try realmConfiguration()
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
        }
        catch{
            print(error.localizedDescription)
        }
    }
}