//
// Created by Настя on 26.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import RealmSwift
import Foundation

protocol ChannelRepositoryProtocol {
    func getAll() -> [Channel]
    func delete(urlToSource: String)
    func add(channel: ChannelViewModel)
}