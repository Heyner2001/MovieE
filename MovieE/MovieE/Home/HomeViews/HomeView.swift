//
//  HomeView.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 2/07/21.
//

import UIKit

class HomeView: UIView {
    
    private var moviesArray: [Movie]
    private let movieCellKey = "MovieCollectionCellView"
    
    private let homeNavBar = HomeNavBarView()
    private lazy var moviesCollectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        collection.register(MovieCollectionCellView.self,
                            forCellWithReuseIdentifier: movieCellKey)
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    init(moviesPage: MoviesPage) {
        self.moviesArray = moviesPage.results
        super.init(frame: .zero)
        addSubview(homeNavBar)
        addSubview(moviesCollectionView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        homeNavBar.snp.makeConstraints { $0.left.right.topMargin.equalToSuperview() }
        moviesCollectionView.snp.makeConstraints {
            $0.top.equalTo(homeNavBar.snp.bottom).offset(12)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.bottomMargin.equalToSuperview()
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: movieCellKey, for: indexPath) as? MovieCollectionCellView else {
            return UICollectionViewCell() }
        
        cell.setUpMovieData(movieData: moviesArray[indexPath.row])
        
        return cell
    }
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 113, height: 163)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
