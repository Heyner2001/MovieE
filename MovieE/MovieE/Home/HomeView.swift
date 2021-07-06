//
//  HomeView.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 2/07/21.
//

import UIKit

class HomeView: UIView {
    
    private var moviesReuseblaCollection: MoviesCollectionView
    
    init(moviesPage: MoviesPage) {
        self.moviesReuseblaCollection = MoviesCollectionView(moviesArray: moviesPage.results)
        super.init(frame: .zero)
        addSubview(moviesReuseblaCollection)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        moviesReuseblaCollection.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.bottomMargin.equalToSuperview()
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
