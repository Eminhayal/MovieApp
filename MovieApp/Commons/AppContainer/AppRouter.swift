//
//  AppRouter.swift
//  MovieApp
//
//  Created by Emin Hayal on 11.01.2022.
//

import Foundation
import UIKit


final class AppRouter {
    
    static var shared = AppRouter()
    
    init() {}
    
    func showDetailPage(_ navigationController: UINavigationController?, imdbID: String) {
        let viewController = DetailVC.instantiate(storyboard: .main, bundle: nil, identifier: nil)
        let viewModel = DetailVM(imdbID: imdbID)
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
}
