//
// Created by Настя on 07.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import SwiftUI
import Foundation

struct AllNews: View {
    var news: [NewsData]

    var body: some View{
        NavigationView{
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
    static var previews: some View {
ContentView()
    }
}

//вьюшка
struct NewsList: View {
    var title: String = "News!"
    var description: String = "Description"

    var body: some View {
        //card!!!!!!!!!!
        
            VStack {
             Text(title).bold()
             Text(description)
        //Image("1")

            }
        
           
    }
}

//данные вьюшки
struct NewsData: Identifiable {
    var id: Int
    var name: String
    var description: String
    //var image:
}


