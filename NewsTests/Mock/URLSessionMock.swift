////
//// Created by Настя on 26.06.2020.
//// Copyright (c) 2020 Настя. All rights reserved.
////
//
//import Foundation
//
//class MockURLSession: URLSessionProtocol {
//
//    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
//    var nextDataTask = MockURLSessionDataTask()
//    var nextData: Data?
//    var nextError: Error?
//
//    private (set) var lastURL: URL?
//
//    func successHttpURLResponse(request: Request) -> URLResponse {
//        return HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
//    }
//
//    func wrongHttpURLResponse(request: Request, statusCode:Int) -> URLResponse {
//        return HTTPURLResponse(url: request.url!, statusCode: statusCode, httpVersion: "HTTP/1.1", headerFields: nil)!
//    }
//
//    func dataTask(with request: Request, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
//        lastURL = request.url
//        nextDataTask.resume()
//        completionHandler(nextData, successHttpURLResponse(request: request), nextError)
//        return nextDataTask
//    }
//
//}

//protocol URLSessionProtocol {
//    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
//
//    func dataTask(with request: Request, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
//}