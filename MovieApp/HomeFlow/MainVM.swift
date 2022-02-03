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
    
 
}

protocol MainVMDelegateOutputs : AnyObject{
    func reloadTableView() //
    func emptySearch(anyResult: Bool)

}

class MainVM : MainVMDelegate {

    var network = Network()
    weak var delegate: MainVMDelegateOutputs?
    var respons : [Search] = []
    
   
    func getServiceData(searchText : String ) {
        if searchText == "" {
            delegate?.emptySearch(anyResult: true)
            return
        }
        network.getDownloadMovie(search : searchText) {[weak self] (movie , err) in
            guard let self = self else {return}
            if let movie = movie {
                self.respons = movie.search // data viewModel'da duruyor
                let sonucVarMi: Bool = movie.search.count != 0
                self.delegate?.emptySearch(anyResult: sonucVarMi)
            } else {
                self.respons = []
                self.delegate?.emptySearch(anyResult: false)
            }
            self.delegate?.reloadTableView() // data tuttuktan sonra tableView yenileyelim

        }
    }
}
