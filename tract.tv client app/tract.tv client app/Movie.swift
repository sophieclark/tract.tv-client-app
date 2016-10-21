//
//  Movie.swift
//  tract.tv client app
//
//  Created by C2057175_Sophie_Clark on 19/10/2016.
//  Copyright © 2016 Sophie Clark. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie {
  var watchers: Int = 0
  var title: String = ""
  var year: Int = 0
  var rating: String = ""
  var trakt: Int = 0
  var slug: String = ""
  var imdb: String = ""
  var tmdb: Int = 0
  var overview: String = ""
  var posterImageUrl: String = ""
  var thumbImageUrl: String = ""
  
  func movieFromJSON(json: JSON) {
    self.watchers = json["watchers"].intValue
    self.title = json["movie"]["title"].stringValue
    self.year = json["movie"]["year"].intValue
    self.rating = json["movie"]["certification"].stringValue
    self.trakt = json["movie"]["ids"]["trackt"].intValue
    self.slug = json["movie"]["ids"]["slug"].stringValue
    self.imdb = json["movie"]["ids"]["imdb"].stringValue
    self.tmdb = json["movie"]["ids"]["tmdb"].intValue
    self.overview = json["movie"]["overview"].stringValue
    self.posterImageUrl = json["movie"]["images"]["poster"]["full"].stringValue
    self.thumbImageUrl = json["movie"]["images"]["poster"]["thumb"].stringValue
  }
  
  class func moviesFromJson(json: JSON) -> [Movie] {
    var movies = [Movie]()
    for movieJSON in json.arrayValue {
      let movie = Movie()
      movie.movieFromJSON(json: movieJSON)
      movies.append(movie)
    }
    return movies
  }
  
  
}
