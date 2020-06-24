//
// Created by Настя on 11.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import SwiftUI
import Foundation
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL

    private var cancellable: AnyCancellable?

    deinit {
        cancellable?.cancel()
    }

    private var cache: ImageCache?

    init(url: String, cache: ImageCache? = nil) {
        //TODO try catch
        self.url = URL(string: url)!
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