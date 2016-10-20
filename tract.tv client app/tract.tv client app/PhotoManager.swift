//
//  PhotoManager.swift
//  tract.tv client app
//
//  Created by C2057175_Sophie_Clark on 19/10/2016.
//  Copyright © 2016 Sophie Clark. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class PhotoManager {
  static let shared = PhotoManager()
  let service = TractTvService()
  
  private var dataPath: String {
    return Bundle.main.path(forResource: "MoviePhotos", ofType: "plist")!
  }
  
  let imageCache = AutoPurgingImageCache(
    memoryCapacity: UInt64(100).megabytes(),
    preferredMemoryUsageAfterPurge: UInt64(60).megabytes()
  )
  
  func cache(_ image: Image, for url: String) {
    imageCache.add(image, withIdentifier: url)
  }
  
  func cachedImage(for url: String) -> Image? {
    return imageCache.image(withIdentifier: url)
  }
  
  func retrieveImage(withURL url: String, completion: @escaping (UIImage) -> Void) -> Image {
    var image = UIImage()
    let request = service.retrieveImage(for: url, completion: { imageResponse in
      self.cache(imageResponse, for: url)
      image = imageResponse
    })
    return image
  }
}
