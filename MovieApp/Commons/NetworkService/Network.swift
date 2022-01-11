//
//  Network.swift
//  MovieApp
//
//  Created by Emin Hayal on 19.12.2021.
//

import Foundation
import Alamofire


class Network {
    func getDownloadMovie(search: String, completion: @escaping (Movie? , String ) -> Void) {
        
        AF.request("https://www.omdbapi.com/?apikey=de5d2fa8&s=\(search)&page=1")
        .validate()
        .responseDecodable(of: Movie.self) { [weak self] (response) in
            if let movies = response.value {
                completion(movies , "")
            } else {
                completion(nil, response.error?.localizedDescription ?? "")
            }
        }
    }
}
