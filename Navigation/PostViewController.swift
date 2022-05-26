//
//  PostViewController.swift
//  Navigation
//
//  Created by Екатерина Александренко on 26.05.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var closure: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = postTitle
        makeBarItem()
    }
    
    var postTitle: String = "Post"
    private func makeBarItem() {
        let rightBarItem = UIBarButtonItem(title: "Information", style: .plain, target: self, action: #selector(buttonAction))
        self.navigationItem.title = postTitle
        navigationItem.rightBarButtonItem = rightBarItem
    }
    
    @objc private func buttonAction() {
        let infoView = InfoViewController()
        navigationController?.pushViewController(infoView, animated: true)
    }
}
