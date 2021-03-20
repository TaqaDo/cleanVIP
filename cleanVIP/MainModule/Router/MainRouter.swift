//
//  MainRouter.swift
//  cleanVIP
//
//  Created by talgar osmonov on 18/3/21.
//

import UIKit

protocol MainRoutingLogic {
    func navigateToArticles()
}

protocol MainDataPassing {
  var dataStore: MainDataStore? { get }
}

final class MainRouter: MainRoutingLogic, MainDataPassing {

  // MARK: - Public Properties

  weak var parentController: UIViewController?
  weak var viewController: MainViewController?
  var dataStore: MainDataStore?
  
  // MARK: - Private Properties
  
  //

  // MARK: - Routing Logic
    func navigateToArticles() {
        let articlesViewController = ArticlesBuilder().makeScene()
        viewController?.navigationController?.pushViewController(articlesViewController, animated: true)
        
    }
  //

  // MARK: - Navigation
  
  //

  // MARK: - Passing data
  
  //
}
