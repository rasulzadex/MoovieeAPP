//
//  SearchCoordinator.swift
//  MoovieeAPP
//
//  Created by Javidan on 23.12.24.
//

import Foundation
import UIKit.UINavigationController

final class SearchCoordinator: Coordinator {
    var parentCoordinator: (any Coordinator)?
    
    var children: [any Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = SearchController(viewModel: .init())
        showController(vc: controller)
    }
    
    
}
