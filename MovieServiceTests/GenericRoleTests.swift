//
//  GenericRoleTests.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/14/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import XCTest
@testable import MovieService

class GenericRoleTests: XCTestCase {
    
    func testNilInitializer() {
        let genericRole = GenericRole()
        
        XCTAssertNil(genericRole.name, "Name should be nil")
        XCTAssertNil(genericRole.biography, "Biography should be nil")
        XCTAssertNil(genericRole.dateOfBirth, "Date of birth should be nil")
        XCTAssertNil(genericRole.nominated, "nominated should be nil")
        XCTAssertNil(genericRole.film, "Film should be nil")
    }
    
    func testInitializer() {
        let data = ["name": "Generic Role", "biography": "This is just a generic bio", "dateOfBirth": 0, "nominated": false] as [AnyHashable: Any]
        
        let genericRole = GenericRole(data: data)
        
        XCTAssertEqual(genericRole.name, "Generic Role")
        XCTAssertEqual(genericRole.biography, "This is just a generic bio")
        XCTAssertEqual(genericRole.dateOfBirth?.toString(style: .medium), "Jan 1, 1970")
        XCTAssertEqual(genericRole.nominated, false)
    }
    
}
