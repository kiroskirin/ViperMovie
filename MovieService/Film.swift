//
//  Film.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/15/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import Foundation

enum FilmRating {
    case NotYetRate, G, PG, PG13, R, NC17
    func toString() -> String {
        switch self {
        case .NotYetRate:
            return "Not Yet Rating"
        case .G:
            return "G"
        case .PG:
            return "PG"
        case .PG13:
            return "PG13"
        case .R:
            return "R"
        case .NC17:
            return "NC17"
        }
    }
}

struct DetailInfo {
    let title: String
    let subtitle: String
}

class Film {
    var name: String?
    var director: Director?
    var cast: [Actor]?
    var languages: [String]?
    var releaseDate: Date?
    var filmRating: FilmRating = .NotYetRate
    var rating: Double = 0.0
    
    init() { }
    init(data: [AnyHashable: Any]) {
        self.name = data["name"] as? String ?? nil
        self.rating = data["rating"] as? Double ?? 0.0
        if let ratingRange = data["filmRating"] as? Int {
            switch ratingRange {
            case 0:
                self.filmRating = .G
            case 1:
                self.filmRating = .PG
            case 2:
                self.filmRating = .PG13
            case 3:
                self.filmRating = .R
            case 4:
                self.filmRating = .NC17
            default:
                break
            }
        }
        if let release = data["releaseDate"] as? Int {
            self.releaseDate = Date(timeIntervalSince1970: Double(release))
        }
        if let directorData = data["director"] as? [AnyHashable: Any] {
            self.director = Director(data: directorData)
        }
        if let langs = data["languages"] as? [String] {
            self.languages = []
            for lang in langs {
                self.languages?.append(lang)
            }
        }
        if let casts = data["casts"] as? [ [AnyHashable: Any] ] {
            self.cast = []
            for cast in casts {
                let actor = Actor(data: cast)
                actor.film = self
                self.cast?.append(actor)
            }
        }
    }
    
    func toDetailList() -> [DetailInfo]? {
        var details = [DetailInfo]()
        if let director = self.director {
            details.append(DetailInfo(title: "Director Name", subtitle: director.name ?? ""))
        }
        if let casts = self.cast {
            for item in casts {
                details.append(DetailInfo(title: "Actor Name", subtitle: item.name ?? ""))
                details.append(DetailInfo(title: "Screen Name", subtitle: item.screenName ?? ""))
            }
        }
        return details
    }
}
