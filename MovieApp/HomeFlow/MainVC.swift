//
//  ViewController.swift
//  MovieApp
//
//  Created by Emin Hayal on 19.12.2021.
//

import UIKit

class MainVC: UIViewController {

    var viewModel : MainVMDelegate = MainVM()
    
    @IBOutlet weak var MyTableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imageSearch: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        MyTableView.delegate = self
        MyTableView.dataSource = self
        MyTableView.register(MineTableViewCell.nibName, forCellReuseIdentifier: MineTableViewCell.identifier)// Bunlar good
        MyTableView.isHidden = true
        
        
    }
    @IBAction func searchButtonClicked(_ sender: Any) {
        var searchText = searchBar.text
        SwiftSpinner.show("Loading")
        viewModel.getServiceData(searchText: searchText ?? "")
        MyTableView.isHidden = false
        
    }
}

extension MainVC : MainVMDelegateOutputs {
        func emptySearch(anyResult: Bool) {
            //MyTableView.isHidden != anyResult
            imageSearch.isHidden = anyResult
        }
    
    func reloadTableView() {
        MyTableView.reloadData() // delegate geldiğinde refresh
        SwiftSpinner.hide()
    }
}

extension MainVC : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.respons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MineTableViewCell.identifier, for: indexPath) as! MineTableViewCell // Good
        let src = viewModel.respons[indexPath.row]
        cell.configure(search: src)
        SwiftSpinner.hide()
        if (Double(indexPath.row) * 100) / (100 * Double(viewModel.respons.count)) > 0.8 {
            SwiftSpinner.show("Loading")
            viewModel.getNewData()
            SwiftSpinner.hide()
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = viewModel.respons[indexPath.row].imdbID
        AppRouter.shared.showDetailPage(self.navigationController, imdbID: movieId)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

/*
 
 20
 
 
 */
