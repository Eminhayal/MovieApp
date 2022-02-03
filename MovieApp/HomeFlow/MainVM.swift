//
//  MainVM.swift
//  MovieApp
//
//  Created by Emin Hayal on 19.12.2021.
//

import Foundation

protocol MainVMDelegate {
    var delegate: MainVMDelegateOutputs? {get set }
    var respons: [Search] { get set } //
    func getServiceData(searchText : String)
    func getNewData()
 
}

protocol MainVMDelegateOutputs : AnyObject{
    func reloadTableView() //
    func emptySearch(anyResult: Bool)
}

class MainVM : MainVMDelegate {

    var network = Network()
    weak var delegate: MainVMDelegateOutputs?
    var respons : [Search] = []
    var page : Int = 1
    var searchText : String = ""
   
    func getServiceData(searchText : String ) {
        if searchText == "" {
            self.respons = []
            self.delegate?.reloadTableView()
            delegate?.emptySearch(anyResult: false)
            
            return
        }
        network.getDownloadMovie(search : searchText.replacingOccurrences(of: " ", with: "%20") ) {[weak self] (movie , err) in
            guard let self = self else {return}
            self.page = 1
            self.searchText = searchText
            if let movie = movie {
                self.respons = movie.search // data viewModel'da duruyor
                let sonucVarMi: Bool = movie.search.count != 0
                self.delegate?.emptySearch(anyResult: sonucVarMi)
            }else {
                self.respons = []
                self.delegate?.emptySearch(anyResult: false)
            }
            self.delegate?.reloadTableView() // data tuttuktan sonra tableView yenileyelim

        }
    }
    func getNewData(){
        self.page += 1
        network.getDownloadMovie(search: searchText.replacingOccurrences(of: " ", with: "%20") , page: page) { [weak self ] (movies, err) in
            guard let self = self else {return}
            if let movies = movies {
                self.respons.append(contentsOf: movies.search)
            }
            self.delegate?.reloadTableView()
        }
    }
}
