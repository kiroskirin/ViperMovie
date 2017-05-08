//
//  Actor.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/15/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import Foundation

class Actor: GenericRole {
    var screenName: String?
    override init() { super.init() }
    override init(data: [AnyHashable : Any]) {
        super.init(data: data)
        self.screenName = data["screenName"] as? String ?? ""
    }
}
