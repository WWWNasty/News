//
// Created by Настя on 07.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import SwiftUI
import Foundation

struct AllNewsChannels: View {
    var channels: [Channel]

    var body: some View {
        NavigationView {
            VStack {
                List(channels) { channel in
                    VStack {
                        NewsChannel(title: channel.name, description: channel.description)
                    }
                }
            }.navigationBarTitle("List channels")
        }
    }
}

struct firstViewTab_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//вьюшка
struct NewsChannel: View {
    var title: String = "News channel!"
    var description: String = "Description"

    var body: some View {
        VStack {
            //star!!!!!!!!
            Text(title).bold()
            Text(description)
        }
    }
}

//данные вьюшки
struct Channel: Identifiable {
    var id: Int
    var name: String
    var description: String
}


