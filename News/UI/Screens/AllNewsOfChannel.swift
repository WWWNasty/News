////
//// Created by Настя on 07.06.2020.
//// Copyright (c) 2020 Настя. All rights reserved.
////
//
//import SwiftUI
//import Foundation
//
//struct AllNews: View {
//    @Environment(\.imageCache) var cache: ImageCache
//
//    var news: [Article]
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List(news) { (newsData:Article) in
//                    VStack {
//                        NewsList(title: newsData.name, description: newsData.description, cache: self.cache, url: self.url)
//                    }
//                }
//            }
//        }.navigationBarTitle("List all news")
//    }
//}
//
////struct allFavouriteNewsPreviews: PreviewProvider {
////
////    static var previews: some View {
////        AllNews(news: )
////    }
////}
