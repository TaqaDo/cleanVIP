//
//  ArticlesViewControllerViewController.swift
//  cleanVIP
//
//  Created by talgar osmonov on 18/3/21.
//

import UIKit

protocol ArticlesDisplayLogic: AnyObject {
    func display(data: ViewData)
}

final class ArticlesViewController: UIViewController {
  
  // MARK: - Public Properties

  var interactor: ArticlesViewControllerBusinessLogic?
  var router: (ArticlesRoutingLogic & ArticlesDataPassing)?
  
  lazy var contentView: ArticlesViewLogic = ArticlesView()

  // MARK: - Private Properties

  //

  // MARK: - Lifecycle
    
    
  override func loadView() {
    view = contentView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    fetchArticles()
  }

  // MARK: - Public Methods
  
  //

  // MARK: - Requests
    
    private func fetchArticles() {
        interactor?.fetchArticles()
    }
  
  //

  // MARK: - Private Methods

  private func configure() {
    contentView.makeTableView(withDataSourceAndDelegate: self)
  }
  
  // MARK: - UI Actions
  
  //
}

// MARK: - UITableView DS\Del

extension ArticlesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if case .success(let data) = contentView.dataBase {
            return data.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier,
                                                       for: indexPath) as? ArticleCell else {return UITableViewCell()}
        
        if case .success(let data) = contentView.dataBase {
            cell.setup(data: data[indexPath.row])
            cell.delegate = self
            return cell
        }
        return UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(300)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    

}

// MARK - CellTapDelegate

extension ArticlesViewController: NextDetailDelegate {
    func nextDetail(articleId: Int) {
        print("article tap \(articleId)")
    }
}

// MARK: - Display Logic

extension ArticlesViewController: ArticlesDisplayLogic {
    func display(data: ViewData) {
        
        contentView.setupData(data: data)
        
    }
}
