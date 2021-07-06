//
//  SearchView.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 5/07/21.
//

import UIKit

class SearchView: UIView {
    
    internal var moviesReuseblaCollection = MoviesCollectionView(moviesArray: [])
    
    init() {
        super.init(frame: .zero)
        addSubview(moviesReuseblaCollection)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        moviesReuseblaCollection.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.left.equalToSuperview().offset(16)
            $0.right.bottom.equalToSuperview().offset(-16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
