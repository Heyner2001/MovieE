//
//  SearchNavBarView.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 5/07/21.
//

import UIKit

protocol SearchTextFieldDelegate: class {
    func getSearchData(search: String)
}

class SearchNavBarView: NavBarBase {
    
    internal weak var searchTextFieldDelegate: SearchTextFieldDelegate?
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "static_ic_back")?.withRenderingMode(.alwaysTemplate),
                        for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(searchStack)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var searchStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 4
        stack.addArrangedSubview(searchTextField)
        stack.addArrangedSubview(searchIcon)
        return stack
    }()
    
    internal lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.font = .setFont(.regular, .normal)
        textField.textColor = .black
        textField.placeholder = StringSources.shared.searchPlaceholder
        textField.textAlignment = .left
        textField.autocorrectionType = .no
        textField.returnKeyType = .search
        textField.delegate = self
        return textField
    }()
    
    private let searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .none
        imageView.image = UIImage(named: "static_ic_search")
        return imageView
    }()
    
    override init() {
        super.init()
        contentStack.spacing = 16
        contentStack.addArrangedSubview(closeButton)
        contentStack.addArrangedSubview(searchContainer)
    }
    
    override func setUpConstraints() {
        super.setUpConstraints()
        
        closeButton.snp.makeConstraints { $0.width.equalTo(30) }
        searchStack.snp.makeConstraints { $0.edges.equalTo(searchContainer)
            .inset(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)) }
        searchIcon.snp.makeConstraints { $0.width.equalTo(20) }
    }
    
    @objc private func backAction() {
        globalNavigationViewController?.popViewController(animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchNavBarView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextFieldDelegate?.getSearchData(search: textField.text ?? "")
        return true
    }
}
