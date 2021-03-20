//
//  File.swift
//  cleanVIP
//
//  Created by talgar osmonov on 19/3/21.
//

import Foundation
import UIKit

protocol NextDetailDelegate: class {
    func nextDetail(articleId: Int)
}

class ArticleCell: UITableViewCell {
    
    static let identifier = "CellIdentifier"
    weak var delegate: NextDetailDelegate?
    private var articleId: Int?
    
    
    // MARK - Views
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "TItle"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var descriptionTitle: UILabel = {
        let label = UILabel()
        label.text = "Descriptuin"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
     private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Читать дальше", for: .normal)
        button.addTarget(self, action: #selector(nextDetail), for: .touchUpInside)
        return button
    }()
    
    // MARK - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - Configure
    
    private func configure() {
        addSubviews()
        constraints()
    }
    
    private func addSubviews() {
        addSubview(title)
        addSubview(descriptionTitle)
        addSubview(nextButton)
    }
    
    private func constraints() {
        
        title.anchor(top: topAnchor, left: leftAnchor, paddingTop: 20, paddingLeft: 20)
        
        descriptionTitle.anchor(top: title.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 20, paddingRight: 20)
        
        nextButton.anchor(bottom: bottomAnchor, right:rightAnchor, paddingBottom: 20, paddingRight: 20)
    }
    
    // MARK - Selectors
    
    @objc func nextDetail() {
        guard let articleId = articleId else {return}
        delegate?.nextDetail(articleId: articleId)

    }
    
    //
    
    func setup(data: ArticleBackendModel) {
        articleId = data.articelId
        title.text = data.name
        descriptionTitle.text = data.text
    }
    
}
