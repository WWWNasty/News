//
// Created by Настя on 07.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import SwiftUI
import Foundation

struct AllNews: View {
    @Environment(\.imageCache) var cache: ImageCache
    var  url = URL(string:"https://www.valuewalk.com/wp-content/uploads/2017/05/whitney-tilson-family-22.jpg")!

    var news: [NewsData]

    var body: some View {
        NavigationView {
            VStack {
                List(news) { (newsData:NewsData) in
                    VStack {
                        NewsList(title: newsData.name, description: newsData.description, cache: self.cache, url: self.url)
                    }
                }
            }
        }.navigationBarTitle("List all news")
    }
}

struct allFavouriteNewsPreviews: PreviewProvider {

    static var fakeData = [
        NewsData(id: 1, name: "H", description: "news"),
        NewsData(id: 2, name: "H", description: "news"),
        NewsData(id: 3, name: "H", description: "news"),
        NewsData(id: 4, name: "H", description: "news")
    ]

    static var previews: some View {
        AllNews(news: fakeData)
    }
}

//вьюшка
struct NewsList: View {
    private var image: AsyncImage<Text>

    init(title: String, description: String, cache: ImageCache, url: URL) {
        self.title = title
        self.description = description
        self.image = AsyncImage(url: url, placeholder: Text("fich"), cache: cache);
    }

    var title: String = "News!"
    var description: String = "Description"



    var body: some View {
        //card!!!!!!!!!!
        VStack {
            Spacer()

                VStack {
                    Text(title).frame(minWidth: 0, maxWidth: .infinity).font(.headline).colorInvert()
                    Text(description).colorInvert()
                }.background(Color.black.opacity(0.3))


        }.background(image)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300, alignment: .center)
            .cornerRadius(20)


    }
}

//данные вьюшки
struct NewsData: Identifiable {
    var id: Int
    var name: String
    var description: String
    //var image:
}


