//
//  NavBarBase.swift
//  MovieE
//
//  Created by Heyner Rodriguez on 4/07/21.
//

import UIKit
import SnapKit

class NavBarBase: UIView {
    
    internal lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 4
        return stack
    }()
    
    internal init() {
        super.init(frame: .zero)
        backgroundColor = .RGBColor(r: 255, g: 85, b: 85)
        addSubview(contentStack)
        setUpConstraints()
    }
    
    internal func setUpConstraints() {
        
        snp.makeConstraints { $0.height.equalTo(50) }
        contentStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
                .inset(UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
