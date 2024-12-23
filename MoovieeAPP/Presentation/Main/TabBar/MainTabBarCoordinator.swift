//
//  MainTabBarCoordinator.swift
//  MoovieeAPP
//
//  Created by Javidan on 23.12.24.
//

import Foundation
import UIKit.UINavigationController

final class MainTabBarCoordinator: Coordinator {
    var parentCoordinator: (any Coordinator)?
    
    var children: [any Coordinator] = []
    
    var navigationController: UINavigationController
    
    
    private let tabbarController = MainTabBarController()
    
    private var homeCoordinator: HomeCoordinator?
    private var favCoordinator: FavCoordinator?
    private var profileCoordinator: ProfileCoordinator?
    private var searchCoordinator: SearchCoordinator?
    
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        initializeTabBar()
    }
    
    
    private func initializeTabBar() {
        let homeNavigationController = UINavigationController()
        homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        homeCoordinator?.parentCoordinator = parentCoordinator
        
        let homeItem = UITabBarItem()
        homeItem.title = "Home"
        homeItem.image = UIImage(systemName: "house")
        homeItem.selectedImage = UIImage(systemName: "house.fill")
        homeNavigationController.tabBarItem = homeItem
        
        
        let favNavigationController = UINavigationController()
        favCoordinator = FavCoordinator(navigationController: favNavigationController)
        favCoordinator?.parentCoordinator = parentCoordinator
        
        let favItem = UITabBarItem()
        favItem.title = "Favorites"
        favItem.image = UIImage(systemName: "heart")
        favItem.selectedImage = UIImage(systemName: "heart.fill")
        favNavigationController.tabBarItem = favItem
        
        
        let profNavigationController = UINavigationController()
        profileCoordinator = ProfileCoordinator(navigationController: profNavigationController)
        profileCoordinator?.parentCoordinator = parentCoordinator
        
        let profileItem = UITabBarItem()
        profileItem.title = "Profile"
        profileItem.image = UIImage(systemName: "person")
        profileItem.selectedImage = UIImage(systemName: "person.fill")
        profNavigationController.tabBarItem = profileItem
        
        
        
        let searchNavigationController = UINavigationController()
        searchCoordinator = SearchCoordinator(navigationController: searchNavigationController)
        searchCoordinator?.parentCoordinator = parentCoordinator
        
        let searchItem = UITabBarItem()
        searchItem.title = "Search"
        searchItem.image = UIImage(systemName: "magnifyingglass")
        searchItem.selectedImage = UIImage(systemName: "magnifyingglass")
        searchNavigationController.tabBarItem = searchItem
        
        
        
        tabbarController.viewControllers = [
            homeNavigationController,
            searchNavigationController,
            favNavigationController,
            profNavigationController
        ]
        
        
        navigationController.pushViewController(tabbarController, animated: true)
        
        parentCoordinator?.children.append(homeCoordinator ?? HomeCoordinator(navigationController: UINavigationController()))
        homeCoordinator?.start()
        
        parentCoordinator?.children.append(favCoordinator ?? FavCoordinator(navigationController: UINavigationController()))
        favCoordinator?.start()
        
        parentCoordinator?.children.append(profileCoordinator ?? ProfileCoordinator(navigationController: UINavigationController()))
        profileCoordinator?.start()
        
        parentCoordinator?.children.append(searchCoordinator ?? SearchCoordinator(navigationController: UINavigationController()))
        searchCoordinator?.start()
        
    }
    
    
    
}
