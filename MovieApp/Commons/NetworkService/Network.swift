//
//  Network.swift
//  MovieApp
//
//  Created by Emin Hayal on 19.12.2021.
//

import Foundation
import Alamofire


class Network {
    func getDownloadMovie(search: String, page : Int = 1 , completion: @escaping (Movie? , String ) -> Void) {
        
        AF.request("https://www.omdbapi.com/?apikey=de5d2fa8&page=\(page)&s=\(search)")
        .validate()
        .responseDecodable(of: Movie.self) { [weak self] (response) in
            if let movies = response.value {
                completion(movies , "")
            } else {
                completion(nil, response.error?.localizedDescription ?? "")
            }
        }
    }
    func getDownloadIdMovie(id: String, completion: @escaping (MovieDetail? , String ) -> Void) {
            
        AF.request("https://www.omdbapi.com/?i=\(id)&apikey=de5d2fa8")
        .validate()
        .responseDecodable(of: MovieDetail.self) { [weak self] (response) in
            if let moviesDetail = response.value {
                completion(moviesDetail , "")
            } else {
                completion(nil, response.error?.localizedDescription ?? "")
            }
        }
    }
}
