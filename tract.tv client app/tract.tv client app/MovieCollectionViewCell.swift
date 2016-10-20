//
//  MovieCollectionViewCell.swift
//  tract.tv client app
//
//  Created by C2057175_Sophie_Clark on 19/10/2016.
//  Copyright © 2016 Sophie Clark. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class MovieCollectionViewCell: UICollectionViewCell {
  var photoManager: PhotoManager { return .shared }
  
  @IBOutlet weak var movieNameLabel: UILabel!
  @IBOutlet weak var yearLabel: UILabel!
  @IBOutlet var movieThumbnail: UIImageView!
  
  var movie: Movie!
  var request: Request?
  
  func configure(with movie: Movie) {
    self.movie = movie
    movieNameLabel.text = movie.title
    yearLabel.text = String(movie.year)
    reset()
    loadImage()
    
  }
  
  func reset() {
    movieThumbnail?.image = nil
    request?.cancel()
  }
  
  func loadImage() {
    if let image = photoManager.cachedImage(for: movie.thumbImageUrl) {
      self.movieThumbnail.image = image
      return
    }
    downloadImage()
  }
  
  func downloadImage() {
    self.movieThumbnail.image = photoManager.retrieveImage(withURL: movie.thumbImageUrl)
  }
}
