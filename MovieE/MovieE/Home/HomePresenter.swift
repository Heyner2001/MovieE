//
//  HomePresenter.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 2/07/21.
//

import UIKit

class HomePresenter: UIViewController {
    
    private let homeView = HomeView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
