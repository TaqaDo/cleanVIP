//
//  MainViewController.swift
//  cleanVIP
//
//  Created by talgar osmonov on 18/3/21.
//

import UIKit

protocol MainDisplayLogic: AnyObject {

}

final class MainViewController: UIViewController {
  
  // MARK: - Public Properties

  var interactor: MainBusinessLogic?
  var router: (MainRoutingLogic & MainDataPassing)?
  
  lazy var contentView: MainViewLogic = MainView()

  // MARK: - Private Properties
    
  //

  // MARK: - Lifecycle

  override func loadView() {
    view = contentView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }

  // MARK: - Public Methods
  
  //

  // MARK: - Requests
  
  //

  // MARK: - Private Methods

  private func configure() {
    contentView.makeButton(target: self, selector: #selector(goToTableVIew))
  }
  
  // MARK: - UI Actions
    @objc func goToTableVIew() {
        router?.navigateToArticles()
    }
  //
}


// MARK: - Display Logic

extension MainViewController: MainDisplayLogic {

}
