//
//  MovieListInteractor.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/15/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import Foundation

protocol MovieListInteractorInput: class {
    weak var presenter: MovieListInteractorOutput? { get set }
    var dataManager: MovieListDataManagerInterface? { get set }
    
    func fetchMovie()
}

protocol MovieListInteractorOutput: class {
    func didFetchedMovie(list: [Film])
}

class MovieListInteractor: MovieListInteractorInput {
    var dataManager: MovieListDataManagerInterface?
    weak var presenter: MovieListInteractorOutput?
}

extension MovieListInteractor {
    func fetchMovie() {
        print(#function)
        self.dataManager?.getMovies(completion: { [weak self] list in
            DispatchQueue.main.async {
                self?.presenter?.didFetchedMovie(list: list)
            }
        })
    }
}
