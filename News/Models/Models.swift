//
// Created by Настя on 16.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import RealmSwift
import Foundation

class Channel: Object, Identifiable {
    override var hash: Int {
        var result = id.hashValue
        result = result &* 31 &+ name.hashValue
        result = result &* 31 &+ descriptionChannel.hashValue
        result = result &* 31 &+ urlToSource.hashValue
        return result
    }

    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? Channel else {
            return false
        }
        if self === object {
            return true
        }
        if type(of: self) != type(of: object) {
            return false
        }
        if self.id != object.id {
            return false
        }
        if self.name != object.name {
            return false
        }
        if self.descriptionChannel != object.descriptionChannel {
            return false
        }
        if self.urlToSource != object.urlToSource {
            return false
        }
        return true
    }

    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var descriptionChannel = ""
    @objc dynamic var urlToSource = ""

    convenience init(initializer: (Channel) -> ()) {
        self.init()
        initializer(self)
    }
}

