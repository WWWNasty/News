//
//  ContentView.swift
//  News
//
//  Created by Настя on 06.06.2020.
//  Copyright © 2020 Настя. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 3

    var fakeDataNews = [
        NewsData(id: 1, name: "H", description: "news"),
        NewsData(id: 2, name: "H", description: "news"),
        NewsData(id: 3, name: "H", description: "news"),
        NewsData(id: 4, name: "H", description: "news")
    ]

    var fakeData = [
        Channel(id: 1, name: "Hi", description: "Low"),
        Channel(id: 2, name: "Hi", description: "Low"),
        Channel(id: 3, name: "Hi", description: "Low"),
        Channel(id: 4, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
        Channel(id: 5, name: "Hi", description: "Low"),
    ]

    var body: some View {

        TabView(selection: $selection) {

            //первая таба
            AllNewsChannels(channels: fakeData).tabItem {
                        VStack {

                            Image(systemName: "list.dash").font(.system(size: 16, weight: .black))
                            Text("All channels")
                        }
                    }
                    .tag(0)

            //второй таб
            FavouritesNewsChannels(channels: fakeData).tabItem {
                        VStack {
                            Image(systemName: "star.fill").font(.system(size: 16, weight: .black))
                            Text("Favourite channels")
                        }
                    }
                    .tag(1)

            //третья таба
            SearchInAllNews(news: fakeDataNews).tabItem {
                        VStack {
                            Image(systemName: "magnifyingglass").font(.system(size: 16, weight: .black))
                            Text("Search news")
                        }
                    }
                    .tag(2)


        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

