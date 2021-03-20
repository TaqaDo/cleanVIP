//
//  ArticlesViewControllerBuilder.swift
//  cleanVIP
//
//  Created by talgar osmonov on 18/3/21.
//

import UIKit

protocol ArticlesBuildingLogic: AnyObject {
  func makeScene(parent: UIViewController?) -> ArticlesViewController
}

final class ArticlesBuilder: ArticlesBuildingLogic {
  
  // MARK: - Public Methods
    
  func makeScene(parent: UIViewController? = nil) -> ArticlesViewController {
    let viewController = ArticlesViewController()
    
    let interactor = ArticlesInteractor()
    let presenter = ArticlesPresenter()
    let router = ArticlesRouter()

    interactor.presenter = presenter
    presenter.viewController = viewController
    
    router.parentController = parent
    router.viewController = viewController
    router.dataStore = interactor

    viewController.interactor = interactor
    viewController.router = router
    
    return viewController
  }
}
