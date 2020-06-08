//
// Created by Настя on 07.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import SwiftUI
import UIKit
import Foundation

struct FavouritesNewsChannels: View {

    var fakeData = [
        NewsData(id: 1, name: "H", description: "news"),
        NewsData(id: 2, name: "H", description: "news"),
        NewsData(id: 3, name: "H", description: "news"),
        NewsData(id: 4, name: "H", description: "news")
    ]
    var channels: [Channel]

    var body: some View {
        NavigationView {

            VStack {
                NavigationLink(destination: AllNews(news: fakeData)) {
                             Text("News")
                         }
                List(channels) { channel in
                    VStack {
                        NewsChannel(title: channel.name, description: channel.description)
                    }
                }
            }.navigationBarTitle("List favourites channels")
        }
    }
}


struct secondViewTab_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
