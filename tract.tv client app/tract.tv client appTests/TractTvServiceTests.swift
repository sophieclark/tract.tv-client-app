//
//  TractTvServiceTests.swift
//  tract.tv client app
//
//  Created by C2057175_Sophie_Clark on 21/10/2016.
//  Copyright © 2016 Sophie Clark. All rights reserved.
//

import XCTest

class TractTvServiceTests: XCTestCase {
    let sut = MockTractTvService()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
  func testTrendingMoviesReturnsArrayOfMovies() {
    var movieArray = [Movie()]
    sut.getTrendingMovies(withSuccess: { movies in
      movieArray = movies
      }, withFailure: { failure in
    })
    
    XCTAssertEqual(movieArray.count, 20)
    XCTAssertEqual(movieArray[0].title, "Bad Moms")
  }
    
}
