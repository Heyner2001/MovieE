//
//  MovieDetailPresenter.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 5/07/21.
//

import UIKit

class MovieDetailPresenter: UIViewController {
    
    let detailView: MovieDetailView
    
    init(movieData: Movie) {
        self.detailView = MovieDetailView(movieData: movieData)
        super.init(nibName: nil, bundle: nil)
        view.addSubview(detailView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        detailView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
