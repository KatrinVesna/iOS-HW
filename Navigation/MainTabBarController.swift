//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Екатерина Александренко on 26.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
   
    let feedView = FeedViewController()
    let profileView = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupControllers()
    }

    private func setupControllers() {
        
        let feedNavigationController = UINavigationController(rootViewController: feedView)
        let profileNavigationController = UINavigationController(rootViewController: profileView)
        
        feedView.tabBarItem.title = "Лента"
        feedView.tabBarItem.image = UIImage(systemName: "photo.fill")
        feedView.navigationItem.title = "Лента"
        
        profileView.tabBarItem.title = "Мой профиль"
        profileView.tabBarItem.image = UIImage(systemName: "person.fill")
        profileView.navigationItem.title = "Мой профиль"
        
        viewControllers = [feedNavigationController, profileNavigationController]
    }
}
