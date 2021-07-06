//
//  SearchPresenter.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 5/07/21.
//

import UIKit

class SearchPresenter: UIViewController {
    
    private let searchNavBar = SearchNavBarView()
    private let searchView = SearchView()
    private let moviesLogic = MoviesModel()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        searchNavBar.searchTextField.becomeFirstResponder()
        searchNavBar.searchTextFieldDelegate = self
        view.addSubview(searchNavBar)
        view.addSubview(searchView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        searchNavBar.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalToSuperview().offset(UIApplication.statusBarHeight)
        }
        searchView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(searchNavBar.snp.bottom).offset(12)
            $0.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchPresenter: SearchTextFieldDelegate {
    func getSearchData(search: String) {
        guard search != "" else { return }
        let url = StringSources.shared.getSearchUrl(search: search)
        NetworkManager.shared.getRequest(url: url) { moviesData in
            guard let data = self.moviesLogic.parseJSON(jsonData: moviesData) else { return }
            self.searchView.moviesReuseblaCollection.moviesArray = data.results
            self.searchView.moviesReuseblaCollection.reloadData()
        }
    }
}
