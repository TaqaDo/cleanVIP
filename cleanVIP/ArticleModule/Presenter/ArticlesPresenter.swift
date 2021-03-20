//
//  ArticlesViewControllerPresenter.swift
//  cleanVIP
//
//  Created by talgar osmonov on 18/3/21.
//

import UIKit

protocol ArticlesPresentationLogic {
    func presentData(data: ViewData)
}

final class ArticlesPresenter: ArticlesPresentationLogic {

  // MARK: - Public Properties

  weak var viewController: ArticlesDisplayLogic?

  // MARK: - Private Properties
  
  //

  // MARK: - Presentation Logic

    
    func presentData(data: ViewData) {
        
        viewController?.display(data: data)
    }
  //
}
