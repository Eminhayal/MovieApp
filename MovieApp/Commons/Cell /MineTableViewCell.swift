//
//  MineTableViewCell.swift
//  MovieApp
//
//  Created by Emin Hayal on 4.01.2022.
//

import UIKit

class MineTableViewCell: UITableViewCell {
   
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var typeMovie: UILabel!
    @IBOutlet weak var imagePoster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(search : Search) {
        self.title.text = search.title
        self.year.text = search.year
        self.typeMovie.text = search.type.rawValue
        self.imagePoster.downloaded(from: search.poster)
    }
    
}
extension MineTableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
