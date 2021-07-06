//
//  HomePresenter.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 2/07/21.
//

import UIKit
import Alamofire

class HomePresenter: UIViewController {
    
    private let homeNavBar = HomeNavBarView()
    private var homeView: HomeView?
    private let moviesLogic = MoviesModel()
    
    init(moviesData: Data?) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        
        guard let data = moviesLogic.parseJSON(jsonData: moviesData) else { return }
        homeView = HomeView(moviesPage: data)
        view.addSubview(homeNavBar)
        view.addSubview(homeView ?? UIView())
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        homeNavBar.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalToSuperview().offset(UIApplication.statusBarHeight)
        }
        
        homeView?.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(homeNavBar.snp.bottom).offset(12)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
