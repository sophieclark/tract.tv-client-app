//
//  MovieTests.swift
//  tract.tv client app
//
//  Created by C2057175_Sophie_Clark on 19/10/2016.
//  Copyright © 2016 Sophie Clark. All rights reserved.
//

import XCTest
import SwiftyJSON

class MovieTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testMoviesFromJSONReturnsResults() {
    let testBundle = Bundle(for: type(of: self))
    let filepath = testBundle.path(forResource: "testMovies", ofType: "json")
    let data = NSData(contentsOfFile: filepath!)
    let json = JSON(data: data! as Data)
    
    let movies = Movie.moviesFromJson(json: json)
    
    XCTAssertEqual(movies.count, 20)
    
    
  }
    
}
