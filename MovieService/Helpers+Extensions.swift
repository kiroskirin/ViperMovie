//
//  Helpers+Extensions.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/15/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import Foundation

extension Date {
    /**
     Convert date to string by given style
     - parameter style: The DateFormatter style that support by DateFormatter.Style
     example: `.medium`, `.short`
     */
    func toString(style: DateFormatter.Style) -> String? {
        let format = DateFormatter()
        format.dateStyle = style
        format.timeStyle = .none
        return format.string(from: self)
    }
    
    /**
     Convert date to string by given string format
     - parameter dateFormat: The string format that support by DateFormatter
     example: `yyyy-MM-dd`.
     */
    func toString(dateFormat: String) -> String? {
        let format = DateFormatter()
        format.dateFormat = dateFormat
        return format.string(from: self)
    }
}

extension Double {
    /**
     Convert double to string by given format
     - parameter format: The string format to display decimal number
     example: `%.2f` will display as `0.00`
    */
    func toString(format: String) -> String {
        return String(format: format, self)
    }
}

struct FilmData {
    static var json: [ [AnyHashable: Any] ] {
        return
            [
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
    }
}
