//
// Created by Настя on 11.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import RealmSwift
import SwiftUI
import Foundation

struct NewsChannel: View {
    @State var isFavourite = true

    var title: String
    var description: String
    var id: String
    var urlToSource: String

    var body: some View {
        HStack {
            VStack {
                Text(title).bold()
                Text(description)
            }
            Spacer()

            Button(action:{
                ChannelService(realmService: RealmService()).makeFavourite(title: self.title, description: self.description, id: self.id, urlToSource: self.urlToSource, isFavourite: &self.isFavourite)

            }){
                if isFavourite{
                    Image(systemName: "star.fill").font(.system(size: 16, weight: .regular))
                }
                else {
                    Image(systemName: "star").font(.system(size: 16, weight: .regular))
                }
            }
        }
    }
}


