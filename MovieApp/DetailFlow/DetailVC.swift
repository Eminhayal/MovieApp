//
//  DetailVC.swift
//  MovieApp
//
//  Created by Emin Hayal on 7.01.2022.
//

import UIKit

class DetailVC: UIViewController, DetailVMDelegateOutputs {
   
    var viewModel: DetailVM!
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var ratingNumber: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var released: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var writer: UILabel!
    @IBOutlet weak var actor: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var plot: UILabel!
    @IBOutlet weak var awards: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SwiftSpinner.show("Loading")
        //AppRouter.shared.
        viewModel.delegate = self
        viewModel.getMovieDetail(imdbID: viewModel.imdbID)
        setupUI()    }
    
    func getMovie(movieDetail: MovieDetail) {
        self.tittle.text = movieDetail.title
        self.moviePoster.downloaded(from: movieDetail.poster)
        self.duration.text = movieDetail.runtime
        self.ratingNumber.text = movieDetail.metascore
        self.year.text = movieDetail.year
        self.released.text = movieDetail.released
        self.genre.text = movieDetail.genre
        self.director.text = movieDetail.director
        self.writer.text = movieDetail.writer
        self.actor.text = movieDetail.actors
        self.language.text = movieDetail.language
        self.country.text = movieDetail.country
        self.plot.text = movieDetail.plot
        self.awards.text = movieDetail.awards
        SwiftSpinner.hide()
    }
    
    func setupUI(){
        ratingView.layer.cornerRadius = ratingView.frame.size.width/2
        ratingView.clipsToBounds = true
        ratingView.layer.borderColor = UIColor.darkGray.cgColor
        ratingView.layer.borderWidth = 5.0
    }
}
