//
//  MainTabBarController.swift
//  MoovieeAPP
//
//  Created by Javidan on 23.12.24.
//

import Foundation
import UIKit

final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.tabBar.frame.size.height = view.frame.height/16
        self.tabBar.frame.size.width = view.frame.width - view.frame.width/4
        self.tabBar.frame.origin.y = view.bounds.height - view.safeAreaInsets.top
        self.tabBar.frame.origin.x = (view.bounds.width - self.tabBar.frame.width) / 2
        
    }
    
    
    private func setupTabBar() {
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .white.withAlphaComponent(0.4)
        self.tabBar.layer.borderWidth = 1
        self.tabBar.layer.borderColor = UIColor.appPurple.withAlphaComponent(0.5).cgColor
        self.tabBar.layer.cornerRadius = 16
        self.tabBar.clipsToBounds = true
        self.tabBar.backgroundColor = .appPurple.withAlphaComponent(1)
    }
}
