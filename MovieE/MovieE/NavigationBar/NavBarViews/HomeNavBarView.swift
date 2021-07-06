//
//  HomeNavBarView.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 4/07/21.
//

import UIKit
import SnapKit

class HomeNavBarView: NavBarBase {
    
    private lazy var contentTitle: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.addSubview(titleLabel)
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .setFont(.bold, .large)
        label.text = StringSources.shared.homeTitle
        return label
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "static_ic_search")?.withRenderingMode(.alwaysTemplate),
                        for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
        return button
    }()
    
    override init() {
        super.init()
        contentStack.addArrangedSubview(contentTitle)
        contentStack.addArrangedSubview(searchButton)
    }
    
    override func setUpConstraints() {
        super.setUpConstraints()
        
        titleLabel.snp.makeConstraints {
            $0.left.right.top.bottom.equalTo(contentTitle)
        }
        searchButton.snp.makeConstraints { $0.width.equalTo(30) }
    }
    
    @objc func searchButtonAction() {
        let vc = SearchPresenter()
        globalNavigationViewController?.pushViewController(vc, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
