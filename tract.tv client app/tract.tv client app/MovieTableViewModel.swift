//
//  MovieTableViewModel.swift
//  tract.tv client app
//
//  Created by C2057175_Sophie_Clark on 19/10/2016.
//  Copyright © 2016 Sophie Clark. All rights reserved.
//

import Foundation

class MovieCollectionViewModel {
  let tractService = TractTvService()
  func getMovies(withSuccess success: @escaping (_ movies: [Movie]) -> Void, withFailure failure: @escaping (_ error: Error) -> Void) {
    var movies = [Movie]()
    tractService.getTrendingMovies(withSuccess: { (movie) in
        success(movie)
      }, withFailure: { (error) in
        failure(error)
    })
  }
}
