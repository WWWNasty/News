//
// Created by Настя on 25.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import Foundation

struct ChannelViewModel: Identifiable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(descriptionChannel)
        hasher.combine(urlToSource)
    }

    static func ==(lhs: ChannelViewModel, rhs: ChannelViewModel) -> Bool {
        if lhs.id != rhs.id {
            return false
        }
        if lhs.name != rhs.name {
            return false
        }
        if lhs.descriptionChannel != rhs.descriptionChannel {
            return false
        }
        if lhs.urlToSource != rhs.urlToSource {
            return false
        }
        return true
    }

    var id: String
    var name: String
    var descriptionChannel: String
    var urlToSource: String

}