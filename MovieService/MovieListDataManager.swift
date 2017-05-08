//
//  DataManager.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/15/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import Foundation

protocol MovieListDataManagerInterface: class {
    /**
     Get movie from local or remote with complete handler
     */
    func getMovies(completion:(_ movies: [Film]) -> ())
}

class MovieListDataManager: MovieListDataManagerInterface {
    
    func getMovies(completion: ([Film]) -> ()) {
        print(#function)
        var movie = [Film]()
        for item in FilmData.json {
            movie.append(Film(data: item))
        }
        completion(movie)
    }

}
