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
    func getServiceData()
 
}
protocol MainVMDelegateOutputs : AnyObject{
    func reloadTableView() //
}

class MainVM : MainVMDelegate {
    
    
    var network = Network()
    weak var delegate: MainVMDelegateOutputs?
    var respons : [Search] = []
    
   
    func getServiceData() {
        network.getDownloadMovie {[weak self] (movie , err) in
            guard let self = self else {return}
            self.respons = movie.search // data viewModel'da duruyor
            self.delegate?.reloadTableView() // data tuttuktan sonra tableView yenileyelim
        }
    }
}
