//
//  ViewController.swift
//  MoovieeAPP
//
//  Created by Javidan on 20.12.24.
//

import UIKit
final class HomeController: BaseController {
    private let viewModel: HomeViewModel
    
    private let layout: HomeColletionLayout
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.layout = HomeColletionLayout()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var movieCollection: UICollectionView = {
        let f = UICollectionViewFlowLayout()
        f.minimumLineSpacing = 12
        f.minimumInteritemSpacing = 12
        let c = UICollectionView(frame: .zero, collectionViewLayout: f)
        c.showsVerticalScrollIndicator = false
        c.delegate = self
        c.dataSource = self
        c.register(cell: MovieCell.self )
        c.register(cell: TrailerCell.self)
        c.backgroundColor = .clear
        c.refreshControl = refreshControl
        
        return c
    }()
    
    private lazy var refreshControl = UIRefreshControl().withUsing {
        $0.addTarget(self, action: #selector(reloadPage), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMovieList()
    }
    
    override func configureView() {
        super.configureView()
        view.addViews(view: [movieCollection])
        configureCompositionalLayout()
      
    }
    
    override func configureConstraints() {
        super.configureConstraints()
        movieCollection.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.leadingAnchor,
            bottom: view.bottomAnchor,
            trailing: view.trailingAnchor,
            padding: .init(top: -80, leading: 0, bottom: 0, trailing: 0)
        )
        
    }
    
    @objc private func reloadPage() {
        viewModel.getMovieList()
    }
    
}

extension HomeController {
    
    fileprivate func configureCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, environment in
            guard let self = self else {return nil}
            switch sectionIndex {
            case 0 : return self.layout.trailerSection()
                default: return self.layout.trendingSection()
            }
        }
        movieCollection.setCollectionViewLayout(layout, animated: true)
    }
}


extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
            
        case 1: return 8
        case 2: return 6
        default: return 4
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell: TrailerCell = collectionView.dequeue(for: indexPath)
            return cell
        case 1:
            let cell: MovieCell = collectionView.dequeue(for: indexPath)
            return cell
        case 2:
            let cell: MovieCell = collectionView.dequeue(for: indexPath)
            return cell
        default:
            let cell: MovieCell = collectionView.dequeue(for: indexPath)
            return cell
            
        }
    }
    

    }
