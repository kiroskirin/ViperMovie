//
//  MovieListView.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/14/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import UIKit

protocol MovieListViewInterface: class {
    var presenter: MovieListPresenterInterface? { get set }
    
    func showMovieList(list: [Film])
}

class MovieListView: UITableViewController, MovieListViewInterface {
    
    struct MainStoryBoard {
        struct TableViewCellIdentifier {
            static let movieListCellIdentifier = "movieListCell"
        }
    }
    
    var presenter: MovieListPresenterInterface?
    var movieList: [Film] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movie List"
        self.tableView.tableFooterView = UIView() // Clear table view when no data
        
        self.presenter?.updateMovieList()
    }
}

// MARK:- View interface
extension MovieListView {
    
    func showMovieList(list: [Film]) {
        self.movieList = list
        self.tableView.reloadData()
    }
    
}

// MARK: - Table view data source
extension MovieListView {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainStoryBoard.TableViewCellIdentifier.movieListCellIdentifier, for: indexPath) as! MovieViewCell
        cell.setup(film: self.movieList[ indexPath.row ] )
        return cell
    }
}

// MARK: - Table view delegate
extension MovieListView {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.showMovie(movie: self.movieList[ indexPath.row ])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
