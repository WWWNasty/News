//
// Created by Настя on 07.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import RealmSwift
import SwiftUI
import UIKit
import Foundation

struct FavouritesNewsChannels: View {
    @State var favouriteChannels: Results<Channel>?
    @State var channels: [SourceChannel]

    var body: some View {
        NavigationView {

            VStack {
//                NavigationLink(destination: AllNews(news: channels)) {
//                             Text("News")
//                         }
                List(channels.filter { channel in self.favouriteChannels?.contains { favouriteChannel in
                    channel.id == favouriteChannel.id
                } ?? false }) { channel in
                    VStack {
                        NewsChannel(isFavourite: true, title: channel.name, description: channel.description, id: channel.id)
                    }
                }
                        .onAppear(){

                            Api().getChannels() { (channels) in
                                self.channels = channels
                            }
                            let config = Realm.Configuration(schemaVersion :1)
                            do {
                                let realm = try Realm(configuration: config)
                                self.favouriteChannels = realm.objects(Channel.self)
                            }
                            catch{
                                print(error.localizedDescription)
                            }

                        }
            }.navigationBarTitle("Favourite channels")
        }
    }
}


struct secondViewTab_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
