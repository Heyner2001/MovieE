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
    
    private var movieData: Movie?
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(movieImage)
        return view
    }()
    
    private lazy var movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                              action: #selector(openMovieDetail)))
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
    
    func setUpMovieData(movieData: Movie) {
        self.movieData = movieData
        movieImage.kf.setImage(with: StringSources.shared.getImageMoviesUrl(imageName: movieData.posterPath ?? ""), placeholder: UIImage(named: "static_image_placeholder"))
    }
    
    @objc private func openMovieDetail() {
        guard let data = movieData else { return }
        let vc = MovieDetailPresenter(movieData: data)
        vc.modalPresentationStyle = .overFullScreen
        globalNavigationViewController?.present(vc, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
