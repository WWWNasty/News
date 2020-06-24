//
//  AsyncImage.swift
//  News
//
//  Created by Настя on 08.06.2020.
//  Copyright © 2020 Настя. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct AsyncImage<Placeholder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?

    init(url: String?, placeholder: Placeholder? = nil, cache: ImageCache? = nil, imageDefault: String) {
        var urlToImage = url
        //TODO codding url
        // var urlToImage = url?.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[]{} ").inverted)

        if(urlToImage == nil || urlToImage!.isEmpty) {
            urlToImage = imageDefault
        }
        loader = ImageLoader(url: urlToImage!, cache: cache)
        self.placeholder = placeholder
    }

    var body: some View {
        image.onAppear(perform: loader.load)
                .onDisappear(perform: loader.cancel)
    }

    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                
            } else {
                placeholder
            }
        }
    }
}
