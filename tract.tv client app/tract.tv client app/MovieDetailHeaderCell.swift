//
//  MovieDetailHeaderCell.swift
//  tract.tv client app
//
//  Created by C2057175_Sophie_Clark on 20/10/2016.
//  Copyright © 2016 Sophie Clark. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieDetailHeaderCell: UICollectionViewCell {
  @IBOutlet var moviePosterImageView: UIImageView!
  @IBOutlet var loadingIndicator: UIActivityIndicatorView!
  
  var photoManager: PhotoManager { return .shared }
  
  var movie: Movie!
  var request: Request?
  
  func configure(with movie: Movie) {
    self.movie = movie
    reset()
    loadImage()
    
  }
  
  func reset() {
    moviePosterImageView?.image = nil
    request?.cancel()
  }
  
  func loadImage() {
    if let image = photoManager.cachedImage(for: movie.posterImageUrl) {
      self.moviePosterImageView.image = image
      return
    }
    downloadImage()
  }
  
  func downloadImage() {
    loadingIndicator.startAnimating()
    moviePosterImageView?.image = photoManager.retrieveImage(withURL: movie.posterImageUrl) { image in
      self.moviePosterImageView.image = image
      self.loadingIndicator.stopAnimating()
    }
    
  }

}
