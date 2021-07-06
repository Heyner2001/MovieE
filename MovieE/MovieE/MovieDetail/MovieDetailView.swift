//
//  MovieDetailView.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 5/07/21.
//

import UIKit
import SnapKit

class MovieDetailView: UIView {
    
    private lazy var blurEffectView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeDetail)))
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.addSubview(closeButton)
        view.addSubview(contentStack)
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "static_ic_close")?.withRenderingMode(.alwaysTemplate),
                                for: .normal)
        button.tintColor = .RGBColor(r: 125, g: 125, b: 125)
        button.addTarget(self, action: #selector(closeDetail), for: .touchUpInside)
        return button
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        stack.addArrangedSubview(backdropImage)
        stack.addArrangedSubview(movieNameLabel)
        stack.addArrangedSubview(movieOverview)
        stack.addArrangedSubview(originalLanguageLabel)
        stack.addArrangedSubview(qualificationLabel)
        stack.addArrangedSubview(voteCountLabel)
//        stack.addArrangedSubview(<#T##view: UIView##UIView#>)
        return stack
    }()
    
    private let backdropImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .none
        return imageView
    }()
    
    private let movieNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .setFont(.bold, .huge)
        label.textColor = .black
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private let movieOverview: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .setFont(.regular, .normal)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let originalLanguageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .setFont(.semiBold, .normal)
        label.textColor = .black
        label.numberOfLines = 1
        label.text = StringSources.shared.originalLanguageTitle
        return label
    }()
    
    private let qualificationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .setFont(.semiBold, .normal)
        label.textColor = .black
        label.text = StringSources.shared.qualificationTitle
        return label
    }()
    
    private let voteCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .setFont(.semiBold, .normal)
        label.textColor = .black
        label.text = StringSources.shared.voteCountTitle
        return label
    }()
    
    init(movieData: Movie) {
        super.init(frame: .zero)
        
        backdropImage.kf.setImage(with: StringSources.shared.getImageMoviesUrl(imageName: movieData.backdropPath ?? ""))
        movieNameLabel.text = movieData.title
        movieOverview.text = movieData.overview
        originalLanguageLabel.text?.append(movieData.originalLanguage ?? "")
        qualificationLabel.text?.append("\(String(describing: movieData.voteAverage))")
        voteCountLabel.text?.append("\(String(describing: movieData.voteCount))")
        
        addSubview(blurEffectView)
        sendSubviewToBack(blurEffectView)
        addSubview(contentView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        blurEffectView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        contentView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.85)
            $0.height.greaterThanOrEqualToSuperview().multipliedBy(0.6)
        }
        
        closeButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.left.top.equalToSuperview().offset(16)
        }
        
        contentStack.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp.bottom).offset(12)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.bottom.lessThanOrEqualToSuperview().offset(-16)
        }
        
        backdropImage.snp.makeConstraints { $0.height.equalTo(170) }
    }
    
    @objc private func closeDetail() {
        globalNavigationViewController?.dismiss(animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
