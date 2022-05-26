//
//  FeedViewController.swift
//  Navigation
//
//  Created by Екатерина Александренко on 26.05.2022.
//

import UIKit

struct Post {
    var title : String
}

class FeedViewController: UIViewController {
    
    var post = Post(title: "My post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        makeButton()
    }
    
    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        button.center = view.center
        button.setTitle("Post", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func buttonAction() {
        let myPostView = PostViewController()
        myPostView.postTitle = post.title
        navigationController?.pushViewController(myPostView, animated: true)
    }
}
