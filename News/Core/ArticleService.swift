//
// Created by Настя on 22.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//
import RealmSwift
import Foundation

class ArticleService{

    let channelRepository: ChannelRepositoryProtocol
    let api: NewsApiServiceProtocol

    init(channelRepository: ChannelRepositoryProtocol, api: NewsApiServiceProtocol){
        self.api = api
        self.channelRepository = channelRepository
    }

    //TODO 0 заменить колбек на что-то похожее на async/await
    func getAllFavouriteArticles(allArticles: @escaping ([ArticleAPIResponse]) -> ()) {
        let channelsDomains = channelRepository.getAll().map { channel in
            channel.id
        }.joined(separator: ",")
        api.getFavouriteArticles(domains: channelsDomains, completion: allArticles)

    }

}