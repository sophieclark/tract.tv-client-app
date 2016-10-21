//
//  MockTractTvService.swift
//  tract.tv client app
//
//  Created by C2057175_Sophie_Clark on 21/10/2016.
//  Copyright © 2016 Sophie Clark. All rights reserved.
//

import Foundation
import SwiftyJson

class MockTractTvService: TractTvServiceProtocol {
  var callCount = 0
  var successGET: ((_ response: JSON) -> Void)?
  var successTrending: ((_ movies: [Movie]) -> Void)?
  var completion: ((UIImage) -> Void)?
  var failure: ((_ error: Error) -> Void)?
  
  private func GET(url: String, parameters: [String:AnyObject]?, success: @escaping (_ response: JSON) -> Void, failure: @escaping (_ error: Error) -> Void) {
    self.callCount += 1
    self.successGET = success
    self.failure = failure
  }
  
  func getTrendingMovies(withSuccess success: @escaping (_ movies: [Movie]) -> Void, withFailure failure: @escaping (_ error: Error) -> Void) {
    self.callCount += 1
    self.successTrending = success
    self.failure = failure
  }
  
  func retrieveImage(for url: String, completion: @escaping (UIImage) -> Void) -> Request {
    self.callCount += 1
    self.completion = completion
  }
}
