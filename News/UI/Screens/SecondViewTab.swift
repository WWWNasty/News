////
//// Created by Настя on 07.06.2020.
//// Copyright (c) 2020 Настя. All rights reserved.
////
//import SwiftUI
//import UIKit
//import Foundation
//
//struct FavouritesNewsChannels: View {
//
//    var channels: [Channel]
//
//    var body: some View {
//        NavigationView {
//
//            VStack {
//                NavigationLink(destination: AllNews(news: channels)) {
//                             Text("News")
//                         }
//                List(channels) { channel in
//                    VStack {
//                        NewsChannel(title: channel.name, description: channel.description)
//                    }
//                }
//            }.navigationBarTitle("Favourite channels")
//        }
//    }
//}
//
//
//struct secondViewTab_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
