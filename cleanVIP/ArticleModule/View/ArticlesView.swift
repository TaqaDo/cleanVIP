//
//  ArticlesViewControllerView.swift
//  cleanVIP
//
//  Created by talgar osmonov on 18/3/21.
//


import UIKit

protocol ArticlesViewLogic: UIView {
    func makeTableView(withDataSourceAndDelegate: UITableViewDelegate & UITableViewDataSource) -> UITableView
    func setupData(data: ViewData)
    var dataBase: ViewData {get set}
}

final class ArticlesView: UIView, ArticlesViewLogic {
    

    var dataBase: ViewData = .loading {
        didSet {
            setNeedsLayout()
        }
    }

  // MARK: - Views
    
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .gray
        indicator.hidesWhenStopped = true
        
        return indicator
    }()
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.identifier)
        tableView.becomeFirstResponder()
    return tableView
    }()
  //
  
  // MARK: - Init
  
  override init(frame: CGRect = CGRect.zero) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Internal Methods
  
  //
  
  // MARK: - Private Methods
  
  private func configure() {
    backgroundColor = .white
    addSubviews()
    addConstraints()
  }
  
  private func addSubviews() {
    
    addSubview(tableView)
    addSubview(indicator)
  }
  
  private func addConstraints() {
    tableView.anchor(top: safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: safeAreaLayoutGuide.rightAnchor)
    
    indicator.center(inView: self)
  }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        switch dataBase {
        

        case .loading:
            indicator.isHidden = false
            indicator.startAnimating()
            tableView.isHidden = true
        case .success(_):
            indicator.isHidden = true
            indicator.stopAnimating()
            tableView.isHidden = false
            tableView.reloadData()
        case .failure:
            print("FAIL")
        }
        
    }
    
    // MARK: - ArticlesViewControllerViewLogic
    
    func makeTableView(withDataSourceAndDelegate: UITableViewDataSource & UITableViewDelegate) -> UITableView {
        tableView.delegate = withDataSourceAndDelegate
        tableView.dataSource = withDataSourceAndDelegate
        return tableView
    }
    
    func setupData(data: ViewData) {
        self.dataBase = data
    }

}



