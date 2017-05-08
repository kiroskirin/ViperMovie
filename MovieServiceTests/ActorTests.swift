//
//  ActorTests.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/15/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import XCTest
@testable import MovieService

class ActorTests: XCTestCase {
    
    func testInitializer() {
        let data = ["name": "Actor", "screenName": "Bingo Ripper", "biography": "Its such a wonderful film", "dateOfBirth": 82684800, "nominated": true] as [AnyHashable: Any]
        
        let actor = Actor(data: data)
        
        XCTAssertEqual(actor.name, "Actor")
        XCTAssertEqual(actor.screenName, "Bingo Ripper")
    }
    
    func testActorWithFilm() {
        let film = Film()
        film.name = "Awesome Film"
        
        let actor = Actor()
        actor.film = film
        
        XCTAssertEqual(actor.film?.name, film.name)
    }
    
}
