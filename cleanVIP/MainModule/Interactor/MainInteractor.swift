//
//  MainInteractor.swift
//  cleanVIP
//
//  Created by talgar osmonov on 18/3/21.
//

import Foundation

protocol MainBusinessLogic {

}

protocol MainDataStore {

}

final class MainInteractor: MainBusinessLogic, MainDataStore {

  // MARK: - Public Properties

  var presenter: MainPresentationLogic?
  lazy var worker: MainWorkingLogic = MainWorker()

  // MARK: - Private Properties
  
  //

  // MARK: - Business Logic
  
  //
}
