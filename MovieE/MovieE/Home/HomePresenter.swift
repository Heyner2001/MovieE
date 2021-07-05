//
//  HomePresenter.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 2/07/21.
//

import UIKit
import Alamofire

class HomePresenter: UIViewController {
    
    private var homeView: HomeView?
    private let homeLogic = MoviesModel()
    
    init(moviesData: Data?) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        
        guard let data = homeLogic.parseJSON(jsonData: moviesData) else { return }
        homeView = HomeView(moviesPage: data)
        view.addSubview(homeView ?? UIView())
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        homeView?.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
