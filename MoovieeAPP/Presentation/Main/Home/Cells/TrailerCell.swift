//
//  TrailerCell.swift
//  MoovieeAPP
//
//  Created by Javidan on 26.12.24.
//


import UIKit

//protocol TrailerCellProtocol {
//    var titleString: String {get}
//    var subtitleString: String {get}
////    var iconURL: String {get}
//}
final class TrailerCell: UICollectionViewCell {
    
    private lazy var productImage = UIImageView().withUsing {
        $0.backgroundColor = .clear
        $0.image = UIImage(named: "poster")
        $0.layer.cornerRadius = 12
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.appPurple.cgColor
        $0.layer.masksToBounds = true
    }
    
    private lazy var titleLabel = UILabel().withUsing {
        $0.text = "Better Call Saul"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
    }
       
    private lazy var stackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [productImage, titleLabel])
        s.alignment = .fill
        s.distribution = .fill
        s.axis = .vertical
        s.spacing = 12
        return s
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureUI() {
        addSubview(stackView)
        productImage.heightAnchor.constraint(
            equalTo: heightAnchor, multiplier: 0.9)
        .isActive = true
        stackView.fillSuperview()
    }
    
    func configureCell(model: MovieCellProtocol) {
        titleLabel.text = model.titleString
//        if !model.iconURL.isEmpty {
//            productImage.loadImageURL(url: model.iconURL)
//        }
        
    }
}
