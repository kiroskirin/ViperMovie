//
//  GenericRole.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/14/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import Foundation

class GenericRole {
    var name: String?
    var biography: String?
    var dateOfBirth: Date?
    var nominated: Bool?
    weak var film: Film?
        
    init() { }
    
    init(data: [AnyHashable: Any]) {
        self.name = data["name"] as? String ?? nil
        self.biography = data["biography"] as? String ?? nil
        self.nominated = data["nominated"] as? Bool ?? nil
        if let birthDate = data["dateOfBirth"] as? Int {
            self.dateOfBirth = Date(timeIntervalSince1970: Double(birthDate))
        } else {
            self.dateOfBirth = nil
        }
    }
}
