//
//  MovieCollectionCellView.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 4/07/21.
//

import UIKit
import SnapKit
import Kingfisher

class MovieCollectionCellView: UICollectionViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        //Shadow
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        view.layer.shadowOpacity = 0.2
        
        view.addSubview(movieImage)
        return view
    }()
    
    private let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(containerView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
                .inset(UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6))
        }
        movieImage.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    func setUpMovieImage(url: String) {
        movieImage.kf.setImage(with: StringSources.shared.getImageMoviesUrl(imageName: url))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
