//
// Created by Настя on 16.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import RealmSwift
import Foundation

class Channel: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var descriptionChannel = ""
    @objc dynamic var isFavourite = true
}

class Article: Object {
    @objc dynamic var id = ""
    @objc dynamic var title = ""
    @objc dynamic var descriptionArticle = ""
    //@objc dynamic var urlToImage: String?
}
