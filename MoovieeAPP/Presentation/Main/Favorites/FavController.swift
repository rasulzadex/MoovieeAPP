//
//  FavController.swift
//  MoovieeAPP
//
//  Created by Javidan on 23.12.24.
//

import Foundation
import UIKit

final class FavController: BaseController {
    private let viewModel: FavViewModel
    
    init(viewModel: FavViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
        required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func configureView() {
        super.configureView()
    }
    
    override func configureConstraints() {
        super.configureConstraints()
    }

}
