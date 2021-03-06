//
//  UInt64Extensions.swift
//  tract.tv client app
//
//  Created by C2057175_Sophie_Clark on 19/10/2016.
//  Copyright © 2016 Sophie Clark. All rights reserved.
//

import Foundation

extension UInt64 {
  
  func megabytes() -> UInt64 {
    return self * 1024 * 1024
  }
  
}
