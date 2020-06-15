//
// Created by Настя on 07.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import SwiftUI
import Foundation

struct AllNewsChannels: View {
    @State var channels: [SourceChannel]

    var body: some View {
        NavigationView {
            VStack {

                List(channels) { channel in

                    NewsChannel(title: channel.name, description: channel.description)

                }.onAppear(){
                    Api().getChannels() { (channels) in
                        self.channels = channels
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
