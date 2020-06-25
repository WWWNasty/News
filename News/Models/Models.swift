//
// Created by Настя on 16.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import RealmSwift
import Foundation

class Channel: Object, Identifiable {

    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var descriptionChannel = ""
    @objc dynamic var urlToSource = ""

}

