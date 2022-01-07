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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getServiceData()
        MyTableView.delegate = self
        MyTableView.dataSource = self
        MyTableView.register(MineTableViewCell.nibName, forCellReuseIdentifier: MineTableViewCell.identifier) // Bunlar good
    }
}

extension MainVC : MainVMDelegateOutputs {
  
    func reloadTableView() {
        MyTableView.reloadData() // delegate geldiğinde refresh
    }
}

extension MainVC : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.respons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MineTableViewCell.identifier, for: indexPath) as! MineTableViewCell // Good
        cell.label.text = viewModel.respons[indexPath.row].title
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return print("selected")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}


