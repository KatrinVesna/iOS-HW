//
//  FeedViewController.swift
//  Navigation
//
//  Created by Екатерина Александренко on 26.05.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var verticalStack: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show post", for: .normal)
        button.titleLabel?.textColor = .black
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show post", for: .normal)
        button.titleLabel?.textColor = .black
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
       // self.navigationController?.navigationBar.prefersLargeTitles = true //Делает крупной Navigation Bar
        self.navigationItem.title = "Feed"
        self.navigationItem.backButtonTitle = "Feed"
        self.view.addSubview(self.verticalStack)
        self.verticalStack.addArrangedSubview(self.firstButton)
        self.verticalStack.addArrangedSubview(self.secondButton)
        self.addConstraint()
    }
    
    private func addConstraint() {
        let centerXConst = NSLayoutConstraint(item: verticalStack, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 1)
        let centerYConst = NSLayoutConstraint(item: verticalStack, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 1)
        let firstButtonHeight = self.firstButton.heightAnchor.constraint(equalToConstant: 40)
        let firstButtonWidth = self.firstButton.widthAnchor.constraint(equalToConstant: 250)
        let secondButtonHeight = self.secondButton.heightAnchor.constraint(equalToConstant: 40)
        let secondButtonWidth = self.secondButton.widthAnchor.constraint(equalToConstant: 250)

        NSLayoutConstraint.activate([centerXConst, centerYConst, firstButtonHeight, firstButtonWidth, secondButtonHeight, secondButtonWidth])
    }
    
    @objc private func didTapPostButton() {
        let postVC = PostViewController()
        postVC.closure = {
        }
        self.navigationController?.pushViewController(postVC, animated: true)
    }
}
