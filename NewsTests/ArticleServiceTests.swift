//
// Created by Настя on 26.06.2020.
// Copyright (c) 2020 Настя. All rights reserved.
//

import XCTest
@testable import News


class ArticleServiceTests: XCTestCase {
    private var channelRepositoryMock: ChannelRepositoryMock!
    private var newsApiServiceMock: NewsApiServiceMock!
    private var articleService: ArticleService!


    override func setUpWithError() throws{


        channelRepositoryMock = ChannelRepositoryMock(channels: [
            Channel {
                $0.id = "Channel1"
                $0.name = "nameChannel1"
                $0.descriptionChannel = "descriptionChannel1"
                $0.urlToSource = "urlToSource1"
            },
            Channel {
                $0.id = "Channel2"
                $0.name = "nameChannel2"
                $0.descriptionChannel = "descriptionChannel2"
                $0.urlToSource = "urlToSource2"
            },
            Channel {
                $0.id = "Channel3"
                $0.name = "nameChannel3"
                $0.descriptionChannel = "descriptionChannel3"
                $0.urlToSource = "urlToSource3"
            }

        ])
        newsApiServiceMock = NewsApiServiceMock(
                articles: [
            ArticleAPIResponse(
                    id: "article1",
                    source: SourceArticle(id: "Channel1", name: "nameChannel1"),
                    title: "articletitle1",
                    description: "articledescription1",
                    urlToImage: "urlToImage1" 

            ),
            ArticleAPIResponse(
                    id: "article2",
                    source: SourceArticle(id: "articlesourceid2", name: "namearticlesource2"),
                    title: "articletitle2",
                    description: "articledescription2",
                    urlToImage: "urlToImage2"

            ),
            ArticleAPIResponse(
                    id: "article3",
                    source: SourceArticle(id: "articlesourceid3", name: "namearticlesource3"),
                    title: "articletitle3",
                    description: "articledescription3",
                    urlToImage: "urlToImage3"

            )
        ],
                sourceChannel: [
            ChannelViewModel(
                    id: "Channel1",
                    name: "nameChannel1", 
                    descriptionChannel: "descriptionChannel1",
                    urlToSource: "String"
            ),
            ChannelViewModel(
                    id: "sourceChannelid2", 
                    name: "sourceChannelname2", 
                    descriptionChannel: "sourceChanneldescription2",
                    urlToSource: "String"
            ),
            ChannelViewModel(
                    id: "sourceChannelid3", 
                    name: "sourceChannelname3", 
                    descriptionChannel: "sourceChanneldescription3",
                    urlToSource: "String"
            )

        ])
        articleService = ArticleService(channelRepository: channelRepositoryMock, api: newsApiServiceMock)
    }

    func testGetAllFavouriteArticles() throws{
        //Arrange
        let expectedResult = [ArticleAPIResponse(
                id: "article1",
                source: SourceArticle(id: "Channel1", name: "nameChannel1"),
                title: "articletitle1",
                description: "articledescription1",
                urlToImage: "urlToImage1"

        ),
        ArticleAPIResponse(
                id: "article2",
                source: SourceArticle(id: "articlesourceid2", name: "namearticlesource2"),
                title: "articletitle2",
                description: "articledescription2",
                urlToImage: "urlToImage2"

        ),
        ArticleAPIResponse(
                id: "article3",
                source: SourceArticle(id: "articlesourceid3", name: "namearticlesource3"),
                title: "articletitle3",
                description: "articledescription3",
                urlToImage: "urlToImage3"

        )]
        //Act
        var actualResult: [ArticleAPIResponse] = []
        articleService.getAllFavouriteArticles { responses in actualResult = responses }
        XCTAssert(actualResult == expectedResult)

    }
}
