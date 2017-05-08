//
//  MovieDetailPresenter.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/15/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import Foundation

protocol MovieDetailPresenterInterface: class {
    weak var view: MovieDetailViewInterface? { get set }
    var wireframe: MovieDetailWireframeInterface? { get set }
    var movie: Film? { get set }
    
    func showMovieInfo()
    func showMovieMoreInfo()
}

class MovieDetailPresenter: MovieDetailPresenterInterface {
    weak var view: MovieDetailViewInterface?
    var wireframe: MovieDetailWireframeInterface?
    var movie: Film?
    var details:[DetailInfo]?

    func showMovieMoreInfo() {
        self.view?.showMoreInfo(details: self.details)
    }
    
    func showMovieInfo() {
        self.details = self.movie?.toDetailList()
        self.view?.showMovie(details: self.details?.filter { $0.title == "Director Name" })
    }
}
