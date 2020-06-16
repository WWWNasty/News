//
// Created by Настя on 07.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import RealmSwift
import SwiftUI
import Foundation

struct AllNewsChannels: View {
    @State var channels: [SourceChannel]
    @State var favouriteChannels: Results<Channel>?

    var body: some View {
        NavigationView {
            VStack {

                List(channels) { channel in

                    NewsChannel(isFavourite: self.favouriteChannels?.contains { favouriteChannel in
                        channel.id == favouriteChannel.id
                    } ?? false, title: channel.name, description: channel.description, id: channel.id)

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
            }.navigationBarTitle("Channels")
        }
    }
}

struct firstViewTab_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
