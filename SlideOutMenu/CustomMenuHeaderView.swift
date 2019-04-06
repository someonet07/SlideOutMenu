//
//  CustomMenuHeaderView.swift
//  SlideOutMenu
//
//  Created by Тимур Чеберда on 06/04/2019.
//  Copyright © 2019 Tmur Cheberda. All rights reserved.
//

import UIKit

class SpacerView: UIView {
    
    let space: CGFloat
    
    override var intrinsicContentSize: CGSize {
        return .init(width: space, height: space)
    }
    
    init(space: CGFloat) {
        self.space = space
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomMenuHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        // custom components
        let nameLabel = UILabel()
        nameLabel.text = "Hi There"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        let userNameLabel = UILabel()
        userNameLabel.text = "Build that App"
        
        let statsLabel = UILabel()
        statsLabel.text = "42 following 7991 followers"
        
        let arrangedSubViews = [
            UIView(), nameLabel, userNameLabel, SpacerView(space: 16), statsLabel
        ]
        let stackView = UIStackView(arrangedSubviews: arrangedSubViews)
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
