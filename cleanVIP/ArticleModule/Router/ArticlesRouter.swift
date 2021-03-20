//
//  ArticlesViewControllerRouter.swift
//  cleanVIP
//
//  Created by talgar osmonov on 18/3/21.
//

import UIKit

protocol ArticlesRoutingLogic {

}

protocol ArticlesDataPassing {
  var dataStore: ArticlesDataStore? { get }
}

final class ArticlesRouter: ArticlesRoutingLogic, ArticlesDataPassing {

  // MARK: - Public Properties

  weak var parentController: UIViewController?
  weak var viewController: ArticlesViewController?
  var dataStore: ArticlesDataStore?
  
  // MARK: - Private Properties
  
  //

  // MARK: - Routing Logic
  
  //

  // MARK: - Navigation
  
  //

  // MARK: - Passing data
  
  //
}
