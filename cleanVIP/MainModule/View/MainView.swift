//
//  MainView.swift
//  cleanVIP
//
//  Created by talgar osmonov on 18/3/21.
//


import UIKit

protocol MainViewLogic: UIView {

    func makeButton(target: Any, selector: Selector) -> UIButton
}

final class MainView: UIView {
  
  // MARK: - Views
  
     private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("go to TableView", for: .normal)
        return button
    }()

  
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
    addSubview(backButton)
  
  }
  
  private func addConstraints() {
    backButton.center(inView: self)
  }

}

// MARK: - MainViewLogic

extension MainView: MainViewLogic {

    func makeButton(target: Any, selector: Selector) -> UIButton {
        backButton.addTarget(target, action: selector, for: .touchUpInside)
        return backButton
    }
}
