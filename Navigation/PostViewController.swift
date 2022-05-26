//
//  PostViewController.swift
//  Navigation
//
//  Created by Екатерина Александренко on 26.05.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var postTitle: String = "Post"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = postTitle
        view.backgroundColor = .white
        makeBarItem()
    }
    
    private func makeBarItem() {
        let rightBarItem = UIBarButtonItem(title: "Информация", style: .plain, target: self, action: #selector(buttonAction))
        self.navigationItem.title = postTitle
        navigationItem.rightBarButtonItem = rightBarItem
    }
    
    @objc private func buttonAction() {
        let infoView = InfoViewController()
        navigationController?.pushViewController(infoView, animated: true)
    }
}
