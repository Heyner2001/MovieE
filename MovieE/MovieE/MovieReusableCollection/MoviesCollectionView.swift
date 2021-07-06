//
//  MoviesCollectionView.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 5/07/21.
//

import UIKit

class MoviesCollectionView: UICollectionView {
    
    internal var moviesArray: [Movie]
    private let movieCellKey = "MovieCollectionCellView"
    let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        return flowLayout
    }()

    init(moviesArray: [Movie]) {
        self.moviesArray = moviesArray
        super.init(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        backgroundColor = .clear
        showsVerticalScrollIndicator = false
        register(MovieCollectionCellView.self,
                            forCellWithReuseIdentifier: movieCellKey)
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MoviesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: movieCellKey, for: indexPath) as? MovieCollectionCellView else {
            return UICollectionViewCell() }
        
        cell.setUpMovieData(movieData: moviesArray[indexPath.row])
        
        return cell
    }
}

extension MoviesCollectionView: UICollectionViewDelegateFlowLayout {
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
