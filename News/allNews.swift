//
// Created by Настя on 07.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import SwiftUI
import Foundation

struct AllNews: View {
    var news: [NewsData]

    var body: some View {
        NavigationView {
            VStack {
                List(news) { news in
                    VStack {
                        NewsList(title: news.name, description: news.description)
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
    var title: String = "News!"
    var description: String = "Description"

    var image = AsyncImage(url: URL(string: "https://www.newsbtc.com/wp-content/uploads/2020/06/bitcoin-crypto-traders-shutterstock_1084365701-1-860x570.jpg")!, placeholder: Text("fich"))

    var body: some View {
        //card!!!!!!!!!!
        VStack {
            Spacer()

                VStack {
                    Text(title).frame(minWidth: 0, maxWidth: .infinity).font(.headline).colorInvert()
                    Text(description).colorInvert()
                }.background(Color.black.opacity(0.3))


        }.background(image)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300, alignment: .center).border(Color.gray, width: 2).cornerRadius(20)


    }
}

//данные вьюшки
struct NewsData: Identifiable {
    var id: Int
    var name: String
    var description: String
    //var image:
}


