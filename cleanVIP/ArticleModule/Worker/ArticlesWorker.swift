//
//  ArticlesViewControllerWorker.swift
//  cleanVIP
//
//  Created by talgar osmonov on 18/3/21.
//

import Foundation

protocol ArticlesWorkingLogic {
    func fetchArticles(completion: @escaping(Result<[ArticleBackendModel]?, Error>) -> Void)
}

final class ArticlesWorker: ArticlesWorkingLogic {
  
  // MARK: - Private Properties
  
  //

  // MARK: - Working Logic
    func fetchArticles(completion: @escaping (Result<[ArticleBackendModel]?, Error>) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            var backEndData = [ArticleBackendModel]()
            let elemnt = ArticleBackendModel(articelId: 0,
                                             name: "HEllO",
                                             text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                             raiting: 100)
            
            backEndData.append(elemnt)
            backEndData.append(elemnt)
            backEndData.append(elemnt)
            backEndData.append(elemnt)
            backEndData.append(elemnt)
            backEndData.append(elemnt)
            backEndData.append(elemnt)
            backEndData.append(elemnt)
            backEndData.append(elemnt)
            backEndData.append(elemnt)
            backEndData.append(elemnt)
            backEndData.append(elemnt)
            backEndData.append(elemnt)
            backEndData.append(elemnt)
            backEndData.append(elemnt)
            backEndData.append(elemnt)
            
            completion(.success(backEndData))
            
        }
    }
}
