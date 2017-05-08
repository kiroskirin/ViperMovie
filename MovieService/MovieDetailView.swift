//
//  ViewController.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/14/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import UIKit

protocol MovieDetailViewInterface: class {
    var presenter: MovieDetailPresenterInterface? { get set }
    
    func showMovie(details: [DetailInfo]?)
    func showMoreInfo(details: [DetailInfo]?)
}

class MovieDetailView: UITableViewController, MovieDetailViewInterface {
    
    struct MainStoryBoard {
        struct TableViewCellIdentifier {
            static let detailListCellIdentifier = "detailListCell"
            static let expandListCellIdentifier = "expandListCell"
        }
    }
    
    var presenter: MovieDetailPresenterInterface?
    var details = [DetailInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView() // Clear table view when no data
        self.presenter?.showMovieInfo()
    }
}

extension MovieDetailView {
    func showMovie(details: [DetailInfo]?) {
        guard let _details = details else {
            return
        }
        self.details = _details
        self.details.append(DetailInfo(title: "Expand", subtitle: "Expand Cell"))
        self.tableView.reloadData()
    }
    
    func showMoreInfo(details: [DetailInfo]?) {
        guard let _details = details else {
            return
        }
        self.details = _details
        self.tableView.reloadData()
    }
}

// MARK: - Table view data source
extension MovieDetailView {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.details.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = self.details [ indexPath.row ]
        if item.title == "Expand"
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: MainStoryBoard.TableViewCellIdentifier.expandListCellIdentifier, for: indexPath) as! MovieDetailExpandCell
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: MainStoryBoard.TableViewCellIdentifier.detailListCellIdentifier, for: indexPath) as! MovieDetailListCell
            cell.setUp(detail: item)
            return cell
        }
    }
}

// MARK:- Table view delegate
extension MovieDetailView {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let _ = tableView.cellForRow(at: indexPath) as? MovieDetailExpandCell {
            self.presenter?.showMovieMoreInfo()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }
}
