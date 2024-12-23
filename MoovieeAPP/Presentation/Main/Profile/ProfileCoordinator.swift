//
//  ProfileCoordinator.swift
//  MoovieeAPP
//
//  Created by Javidan on 23.12.24.
//

import Foundation
import UIKit.UINavigationController

final class ProfileCoordinator: Coordinator {
    var parentCoordinator: (any Coordinator)?
    
    var children: [any Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ProfileController(viewModel: .init())
        showController(vc: controller)
    }
    
    
}

