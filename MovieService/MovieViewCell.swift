//
//  MovieViewCell.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/15/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import UIKit

class MovieViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var filmRating: UILabel!
    @IBOutlet weak var rating: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension MovieViewCell {
    func setup(film: Film) {
        self.name.text = film.name
        self.releaseDate.text = film.releaseDate?.toString(style: .medium)
        self.filmRating.text = film.filmRating.toString()
        self.rating.text = film.rating.toString(format: "%.1f")
    }
}
