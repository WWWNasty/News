//
// Created by Настя on 11.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import SwiftUI
import Foundation

struct NewsList: View {
    private var image: AsyncImage<Text>
    var imageDefault = "https://mondrian.mashable.com/2020%252F05%252F16%252Fed%252F65127486efd14faea068927124f3b1ee.253ab.jpg%252F1200x630.jpg?signature=XjJ4aqKaX56MW5k29Zn1ygz0Evc="

    init(title: String, description: String, cache: ImageCache, urlToImage: String?) {
        self.title = title
        self.description = description
        var imageUrl = urlToImage;

        if(imageUrl == nil || imageUrl!.isEmpty) {
            imageUrl = self.imageDefault;
        }
        self.image = AsyncImage(url: imageUrl!, placeholder: Text("loading"), cache: cache)
    }

    var title: String
    var description: String

    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text(title).frame(minWidth: 1, maxWidth: .infinity).font(.title).foregroundColor(Color.white).lineLimit(1)
                Text(description).foregroundColor(Color.white).lineLimit(2).padding(5)
            }.background(Color.black.opacity(0.5))
        }
                .background(image)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 300, alignment: .center)
                .cornerRadius(20)
    }
}

