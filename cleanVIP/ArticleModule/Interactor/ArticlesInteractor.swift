//
//  ArticlesViewControllerInteractor.swift
//  cleanVIP
//
//  Created by talgar osmonov on 18/3/21.
//

import Foundation

protocol ArticlesViewControllerBusinessLogic {
    func fetchArticles()
}

protocol ArticlesDataStore {

}

final class ArticlesInteractor: ArticlesViewControllerBusinessLogic, ArticlesDataStore {

  // MARK: - Public Properties

  var presenter: ArticlesPresentationLogic?
  lazy var worker: ArticlesWorkingLogic = ArticlesWorker()

  // MARK: - Private Properties
  
  //

  // MARK: - Business Logic
    func fetchArticles() {
        
        worker.fetchArticles { [weak self] (data) in
            
            switch data {
            
            case .success(let success):
                if let success = success {
                    self?.presenter?.presentData(data: ViewData.success(success))
                }
            case .failure(let error):
                
                self?.presenter?.presentData(data: ViewData.failure(error: error))
                
            }

        }    
    }
  //
}
