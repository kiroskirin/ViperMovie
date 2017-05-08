//
//  MovieDetailListCell.swift
//  MovieService
//
//  Created by Kraisorn Soisakhu on 4/15/2560 BE.
//  Copyright © 2560 Labs 62. All rights reserved.
//

import UIKit

class MovieDetailListCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension MovieDetailListCell {
    func setUp(detail: DetailInfo) {
        self.title.text = detail.title
        self.subtitle.text = detail.subtitle
    }
}
