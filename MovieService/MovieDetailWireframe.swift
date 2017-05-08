//
//  MovieDetailWireframe.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/15/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import Foundation
import UIKit

protocol MovieDetailWireframeInterface: class {
    static func createDetailView(with movie: Film) -> UIViewController
}

class MovieDetailWireframe: MovieDetailWireframeInterface {
    
    struct StoryBoard {
        static var Main: UIStoryboard {
            return UIStoryboard(name: "Main", bundle: Bundle.main)
        }
        struct ViewIdentifiers {
            static let MovieDetailView = "MSMovieDetailVC"
        }
    }
    
    class func createDetailView(with movie: Film) -> UIViewController {
        if let view = StoryBoard.Main.instantiateViewController(withIdentifier: StoryBoard.ViewIdentifiers.MovieDetailView) as? MovieDetailView {
            
            let presenter = MovieDetailPresenter()
            let wireframe = MovieDetailWireframe()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.movie = movie
            presenter.wireframe = wireframe
            
            return view
        }
        return UIViewController()
    }

    
}
