//
//  ArticleBackendModel.swift
//  cleanVIP
//
//  Created by talgar osmonov on 19/3/21.
//

import Foundation

enum ViewData {
    
    case loading
    case success([ArticleBackendModel])
    case failure(error: Error?)
    
}

struct ArticleBackendModel {
    let articelId: Int
    let name: String
    let text: String
    let raiting: Int
}
