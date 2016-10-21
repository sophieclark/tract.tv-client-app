//
//  MockSessions.swift
//  tract.tv client app
//
//  Created by C2057175_Sophie_Clark on 19/10/2016.
//  Copyright © 2016 Sophie Clark. All rights reserved.
//

import Foundation

//class MockSession: NSURLSession {
//  var completionHandler:((NSData!, NSURLResponse!, NSError!) -> Void)?
//  static var mockResponse: (data: NSData?, urlResponse: NSURLResponse?, error: NSError?)
//  
//  override class func sharedSession() -> NSURLSession {
//    return MockSession()
//  }
//  
//  override func dataTaskWithRequest(request: NSURLRequest, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDataTask {
//    self.completionHandler = completionHandler
//    return MockTask(response: MockSession.mockResponse, completionHandler: completionHandler)
//  }
//  
//  class MockTask: NSURLSessionDataTask {
//    
//    typealias Response = (data: NSData?, urlResponse: NSURLResponse?, error: NSError?)
//    var mockResponse: Response
//    let completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)?
//    
//    init(response: Response, completionHandler:((NSData!, NSURLResponse!, NSError!) -> Void)?) {
//      self.mockResponse = response
//      self.completionHandler = completionHandler
//    }
//    
//    override func resume() {
//      completionHandler!(mockResponse.data, mockResponse.urlResponse, mockResponse.error)
//    }
//  }
//}

//typealias DataTaskResult = (NSData?, URLResponse?, NSError?) -> Void
//
//protocol URLSessionProtocol {
//  func dataTaskWithURL(url: NSURL, completionHandler: DataTaskResult)
//    -> URLSessionDataTask
//}
