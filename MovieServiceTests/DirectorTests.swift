//
//  DirectorTests.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/15/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import XCTest
@testable import MovieService

class DirectorTests: XCTestCase {
    
    func testInitializer() {
        let data = ["name": "Director", "biography": "This is my first film", "dateOfBirth": 1481721300, "nominated": true] as [AnyHashable: Any]
        
        let director = Director(data: data)
        
        XCTAssertEqual(director.name, "Director")
        XCTAssertEqual(director.dateOfBirth?.toString(style: .medium), "Dec 14, 2016")
    }
}
