//
//  Network.swift
//  MovieApp
//
//  Created by Emin Hayal on 19.12.2021.
//

import Foundation
import Alamofire


class Network {
    var data: [Search]?
    var response : Movie?
    
    
    func getDownloadMovie(completion: @escaping (Movie , String ) -> Void) {
        
        AF.request("https://www.omdbapi.com/?apikey=de5d2fa8&s=Fast&page=1")
        .validate()
        .responseDecodable(of: Movie.self) { (response) in
          guard let movies = response.value else { return }
            completion(movies , "")
            //self.data = movies.search
            //self.response = movies
        }
    }
}
