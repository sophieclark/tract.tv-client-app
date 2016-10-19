//
//  TractTvService.swift
//  tract.tv client app
//
//  Created by C2057175_Sophie_Clark on 19/10/2016.
//  Copyright © 2016 Sophie Clark. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TractTvService {
  let baseURL = "https://api.trakt.tv/"
  let tracttvApiKey = "0e7e55d561c7e688868a5ea7d2c82b17e59fde95fbc2437e809b1449850d4162"
  let fanartTVApiKey = "ed99242c8446dbd2375927a338f6969d"
  
  private func GET(url: String, parameters: [String:AnyObject]?, success: @escaping (_ response: JSON) -> Void, failure: @escaping (_ error: Error) -> Void) {
    var headers: [String:String] = [:]
    headers["trakt-api-version"] = "2"
    headers["trakt-api-key"] = "0e7e55d561c7e688868a5ea7d2c82b17e59fde95fbc2437e809b1449850d4162"
    Alamofire.request("https://api.trakt.tv/movies/trending", parameters:parameters, headers: headers).responseJSON { response in
      switch response.result {
      case .success:
        let json = JSON(data: response.data!)
        print(json)
        success(json)
      case .failure(let error):
        failure(error)
      }
    }
  }
  
  func getTrendingMovies(withSuccess success: @escaping (_ movies: [Movie]) -> Void, withFailure failure: @escaping (_ error: Error) -> Void) {
    let url = baseURL + "movies/trending"
    
    var params = [String:AnyObject]()
    params["page"] = 1 as AnyObject?
    params["limit"] = 20 as AnyObject?
    params["extended"] = "full,images" as AnyObject?
    
    GET(url: url, parameters: params, success: { (response: JSON) in
      let movies = Movie.moviesFromJson(json: response)
      success(movies)
      }, failure: failure)
  }
}
