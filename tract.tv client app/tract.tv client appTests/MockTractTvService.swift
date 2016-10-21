//
//  MockTractTvService.swift
//  tract.tv client app
//
//  Created by C2057175_Sophie_Clark on 21/10/2016.
//  Copyright © 2016 Sophie Clark. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class MockTractTvService: TractTvServiceProtocol {


  var callCount = 0
  var successGET: ((_ response: JSON) -> Void)?
  var successTrending: ((_ movies: [Movie]) -> Void)?
  var completion: ((UIImage) -> Void)?
  var failure: ((_ error: Error) -> Void)?
  
  internal func GET(url: String, parameters: [String:AnyObject]?, success: @escaping (_ response: JSON) -> Void, failure: @escaping (_ error: Error) -> Void) {
    self.callCount += 1
    self.successGET = success
    self.failure = failure
  }
  
  func getTrendingMovies(withSuccess success: @escaping (_ movies: [Movie]) -> Void, withFailure failure: @escaping (_ error: Error) -> Void) {
    self.callCount += 1
    let testBundle = Bundle(for: type(of: self))
    let filepath = testBundle.path(forResource: "testMovies", ofType: "json")
    let data = NSData(contentsOfFile: filepath!)
    let json = JSON(data: data as! Data)
    let movies = Movie.moviesFromJson(json: json)
    success(movies)
    self.successTrending = success
    self.failure = failure
  }
  
  internal func retrieveImage(for url: String, completion: @escaping (UIImage) -> Void) -> Request {
    return Alamofire.request(url, method: .get).responseImage { response in
      guard let image = response.result.value else { return }
      completion(image)
    }
  }
}
