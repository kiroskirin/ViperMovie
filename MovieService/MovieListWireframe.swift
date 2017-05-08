//
//  MovieListWireframe.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/15/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import Foundation
import UIKit

protocol MovieListWireframeInterface: class {
    static func createMovieListViewModule() -> UIViewController
    func presentMovieDetail(from view: MovieListViewInterface?, with movie: Film)
}

class MovieListWireframe : MovieListWireframeInterface {
    
    struct StoryBoard {
        static var Main: UIStoryboard {
            return UIStoryboard(name: "Main", bundle: Bundle.main)
        }
        struct ViewIdentifiers {
            static let MovieListViewNavigation = "MSMovieListNav"
            static let MovieListView = "MSMovieListVC"
        }
    }
    
    class func createMovieListViewModule() -> UIViewController {
        if let nav = StoryBoard.Main.instantiateViewController(withIdentifier: StoryBoard.ViewIdentifiers.MovieListViewNavigation) as? UINavigationController {
            
            if let view = nav.childViewControllers.first as? MovieListView {
                
                let presenter = MovieListPresenter()
                let interactor = MovieListInteractor()
                let dataManager = MovieListDataManager()
                let wireframe = MovieListWireframe()
                
                view.presenter = presenter
                
                presenter.view = view
                presenter.interactor = interactor
                presenter.wireframe = wireframe
                
                interactor.dataManager = dataManager
                interactor.presenter = presenter
                
                return nav
            }
            
        }
        return UIViewController()
    }
    
    func presentMovieDetail(from view: MovieListViewInterface?, with movie: Film) {
        print(#function)
        let detail = MovieDetailWireframe.createDetailView(with: movie)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(detail, animated: true)
        }
    }
}
