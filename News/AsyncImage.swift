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

    init(url: URL, placeholder: Placeholder? = nil, cache: ImageCache? = nil) {
        loader = ImageLoader(url: url, cache: cache)
        self.placeholder = placeholder
    }

    var body: some View {
        image
                .onAppear(perform: loader.load)
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


class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL

    init(url: URL) {
        self.url = url
    }

    private var cancellable: AnyCancellable?

    deinit {
        cancellable?.cancel()
    }

    private var cache: ImageCache?

    init(url: URL, cache: ImageCache? = nil) {
        self.url = url
        self.cache = cache
    }

    func load() {
        if let image = cache?[url] {
            self.image = image
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map { UIImage(data: $0.data) }
                .replaceError(with: nil)
                .handleEvents(receiveOutput: { [weak self] in self?.cache($0) })
                .receive(on: DispatchQueue.main)
                .assign(to: \.image, on: self)
    }

    private func cache(_ image: UIImage?) {
        image.map { cache?[url] = $0 }
    }

    func cancel() {
        cancellable?.cancel()
    }


}

