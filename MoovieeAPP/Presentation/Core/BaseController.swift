//
//  BaseController.swift
//  MoovieeAPP
//
//  Created by Javidan on 20.12.24.
//

import UIKit

class BaseController: UIViewController {
    
    private lazy var background: ReImg = {
        let i = ReImg(imageName: "background", contentMode: .scaleToFill, cornerRadius: 0)
        return i
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        configureView()
        configureConstraints()
    }
    
    open func configureView() {
        view.addViews(view: [background])
    }

    open func configureConstraints() {
        background.fillSuperview()
    }
  
}
