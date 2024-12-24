//
//  ViewController.swift
//  MoovieeAPP
//
//  Created by Javidan on 20.12.24.
//

import UIKit

final class HomeController: BaseController {
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
        required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMovieList()
    }

    override func configureView() {
        super.configureView()
    }
    
    override func configureConstraints() {
        super.configureConstraints()
    }

}

