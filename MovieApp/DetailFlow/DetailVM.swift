//
//  DetailVM.swift
//  MovieApp
//
//  Created by Emin Hayal on 7.01.2022.
//

import Foundation
protocol DetailVMDelegate{
    var delegate: DetailVMDelegateOutputs? {get set}
    var respons : MovieDetail? { get set }
    func getMovieDetail(imdbID : String)
}

protocol DetailVMDelegateOutputs : AnyObject{
    func getMovie(movieDetail : MovieDetail)
}

class DetailVM : DetailVMDelegate {
    
    weak var delegate: DetailVMDelegateOutputs?
    var imdbID: String
    var network = Network()
    var respons : MovieDetail?
   
    
    init(imdbID: String) {
        self.imdbID = imdbID
    }
    
    func getMovieDetail(imdbID : String) {
        
        
        network.getDownloadIdMovie(id: self.imdbID) { [weak self] (movies, err) in
            guard let self = self else {return}
            if let movies = movies {
                self.respons = movies
                self.delegate?.getMovie(movieDetail: self.respons ?? movies)
            }
        }
    }
}
