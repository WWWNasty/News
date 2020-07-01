//
//  ChannelServiceTests.swift
//  NewsTests
//
//  Created by Настя on 30.06.2020.
//  Copyright © 2020 Настя. All rights reserved.
//

import XCTest
@testable import News


class ChannelServiceTests: XCTestCase {

    private var channelRepositoryMock: ChannelRepositoryMock!


    private var channelService: ChannelService!

    override func setUpWithError() throws {

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
         channelService = ChannelService(channelRepository: channelRepositoryMock)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMakeFavourite() throws {
        //Arrange
        let expectedChannel = Channel {
            $0.id = "Channel4"
            $0.name = "nameChannel1"
            $0.descriptionChannel = "descriptionChannel1"
            $0.urlToSource = "urlToSource1"
        }
        let expectedIsFavorite = true
        //Act
        let actualIsFavorite = channelService.makeFavourite(
                channel: ChannelViewModel(id: expectedChannel.id, name: expectedChannel.name, descriptionChannel: expectedChannel.descriptionChannel, urlToSource: expectedChannel.urlToSource),
                isFavourite: false)
        let actualChannel = channelRepositoryMock.channels.last
        //Assert
        XCTAssert(actualChannel == expectedChannel)
        XCTAssert(expectedIsFavorite == actualIsFavorite)
        }

    func testDeleteFavourite() throws {
        //Arrange
        let chanelToRemove = Channel {
            $0.id = "Channel1"
            $0.name = "nameChannel1"
            $0.descriptionChannel = "descriptionChannel1"
            $0.urlToSource = "urlToSource1"
        }
        let expectedIsFavorite = false
        //Act
        let actualIsFavorite = channelService.makeFavourite(
                channel: ChannelViewModel(id: chanelToRemove.id, name: chanelToRemove.name, descriptionChannel: chanelToRemove.descriptionChannel, urlToSource: chanelToRemove.urlToSource),
                isFavourite: true)
        let isDeleted: Bool = !channelRepositoryMock.channels.contains { channel in channel.id == chanelToRemove.id }
        //Assert
        XCTAssert(isDeleted)
        XCTAssert(expectedIsFavorite == actualIsFavorite)
    }

    func testGetFavoriteChannels() throws{
        //Arrange
        let expectedResult = [
        ChannelViewModel(
            id: "Channel1",
            name: "nameChannel1",
            descriptionChannel: "descriptionChannel1",
            urlToSource: "urlToSource1"
        ),
            ChannelViewModel (
            id: "Channel2",
            name: "nameChannel2",
            descriptionChannel: "descriptionChannel2",
            urlToSource: "urlToSource2"
        ),
            ChannelViewModel (
            id: "Channel3",
            name: "nameChannel3",
            descriptionChannel: "descriptionChannel3",
            urlToSource: "urlToSource3"
        )]
        //Act
        var actualResult: [ChannelViewModel] = channelService.getFavoriteChannels()
        //Assert
        XCTAssert(actualResult == expectedResult)

    }
}
