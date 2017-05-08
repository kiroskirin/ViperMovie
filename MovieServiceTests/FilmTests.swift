//
//  FilmTests.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/15/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import XCTest
@testable import MovieService

class FilmTests: XCTestCase {
    
    var films:[Film] = []
    
    override func setUp() {
        super.setUp()
        
        let testData: [ [AnyHashable: Any] ] = [
            [
                "filmRating" : 3,
                "languages": [
                    "English",
                    "Thai"
                ],
                "nominated": 1,
                "releaseDate": 1350000000,
                "casts": [
                    [
                        "dateOfBirth": 436147200,
                        "nominated": 1,
                        "name": "Bryan Cranston",
                        "screenName": "Jack Donnell",
                        "biography": "Bryan Lee Cranston is an American actor, voice actor, writer and director."
                    ]
                ],
                "name": "Argo",
                "rating": 7.8,
                "director": [
                    "dateOfBirth": 82684800,
                    "nominated": 1,
                    "name": "Ben Affleck",
                    "biography": "Benjamin Geza Affleck was born on August 15, 1972 in Berkeley, California, USA but raised in Cambridge, Massachusetts, USA."
                ]
            ]
        ]
        
        for item in testData {
            films.append(Film(data: item))
        }
    }
    
    func testInitializer() {
        let film = Film()
        
        XCTAssertNil(film.name, "Film - name should be nil")
        XCTAssertNil(film.director, "Film - director should be nil")
        XCTAssertNil(film.cast, "Film - cast should be nil")
        XCTAssertNil(film.languages, "Film - languages should be nil")
        XCTAssertNil(film.releaseDate, "Film - releasedate should be nil")
        XCTAssertEqual(film.rating, 0.0, "Film - rating should start at 0.0")
        XCTAssertEqual(film.filmRating.toString(), "Not Yet Rating", "Film - rate should start with not yet rate")
    }
    
    func testTransformList() {
        let details = films.first?.toDetailList()
        XCTAssertEqual(details?.count, 3)
    }
    
    func testTransformDetails() {
        let details = films.first?.toDetailList()
        
        let directorDetail = details?.filter { $0.title == "Director Name" }.first
        XCTAssertEqual(directorDetail?.title, "Director Name")
        XCTAssertEqual(directorDetail?.subtitle, "Ben Affleck")
        
        let castDetail = details?.filter { $0.title == "Actor Name" }.first
        XCTAssertEqual(castDetail?.title, "Actor Name")
        XCTAssertEqual(castDetail?.subtitle, "Bryan Cranston")
        
        let castScreen = details?.filter { $0.title == "Screen Name" }.first
        XCTAssertEqual(castScreen?.title, "Screen Name")
        XCTAssertEqual(castScreen?.subtitle, "Jack Donnell")
    }
    
}
