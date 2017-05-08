//
//  MovieListPresenterProtocol.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/15/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import Foundation

protocol MovieListPresenterInterface: class {
    weak var view: MovieListViewInterface? { get set }
    var interactor: MovieListInteractorInput? { get set }
    var wireframe: MovieListWireframeInterface? { get set }
    
    func updateMovieList()
    func showMovie(movie: Film)
}

class MovieListPresenter {
    weak var view: MovieListViewInterface?
    var interactor: MovieListInteractorInput?
    var wireframe: MovieListWireframeInterface?
}

extension MovieListPresenter: MovieListPresenterInterface {
    
    func updateMovieList() {
        self.interactor?.fetchMovie()
    }
    
    func showMovie(movie: Film) {
        self.wireframe?.presentMovieDetail(from: self.view, with: movie)
    }
}

extension MovieListPresenter: MovieListInteractorOutput {
    func didFetchedMovie(list: [Film]) {
        print(#function)
        self.view?.showMovieList(list: list)
    }
}

