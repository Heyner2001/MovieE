//
//  EmptySearchResultsView.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 5/07/21.
//

import UIKit

class EmptySearchResultsView: UIView {
    
    private lazy var containterStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 4
        stack.addArrangedSubview(emojiLabel)
        stack.addArrangedSubview(titleLabel)
        return stack
    }()
    
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(.bold, .giant)
        label.textAlignment = .center
        label.text = StringSources.shared.emptyResultsEmoji
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .setFont(.bold, .xLarge)
        label.textAlignment = .center
        label.textColor = .black
        label.text = StringSources.shared.emptyResultsTitle
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(containterStack)
        setUpContraints()
    }
    
    private func setUpContraints() {
        containterStack.snp.makeConstraints { $0.center.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
