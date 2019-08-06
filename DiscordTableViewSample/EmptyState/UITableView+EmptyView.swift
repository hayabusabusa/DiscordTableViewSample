//
//  UITableView+EmptyView.swift
//  DiscordTableViewSample
//
//  Created by Yamada Shunya on 2019/08/06.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import UIKit

class EmptyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, title: String, message: String) {
        super.init(frame: frame)
        
        // Labels
        let titleLabel = UILabel()
        titleLabel.textColor = .lightGray
        titleLabel.font = .boldSystemFont(ofSize: 14.0)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.alpha = 0
        
        let messageLabel = UILabel()
        messageLabel.textColor = .lightGray
        messageLabel.font = .systemFont(ofSize: 13.0)
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = message
        messageLabel.textAlignment = .center
        messageLabel.alpha = 0
        
        // StackView
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 4.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(messageLabel)
        
        addSubview(stackView)
        
        // Autolayout
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
            ])
        
        // Animation
        UIView.animate(withDuration: 0.8) {
            titleLabel.alpha = 1.0
            messageLabel.alpha = 1.0
        }
    }
    
    private func commonInit() {
        backgroundColor = .clear
    }
}

extension UITableView {
    
    func setEmptyView(itemCount: Int, separatorStyle: UITableViewCell.SeparatorStyle, title: String, message: String) {
        if itemCount == 0 {
            // Show emptyView
            let rect = CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height)
            let emptyView = EmptyView(frame: rect, title: title, message: message)
            
            self.backgroundView = emptyView
            self.separatorStyle = .none
        } else {
            // Dismiss emptyView
            self.backgroundView = nil
            self.separatorStyle = separatorStyle
        }
    }
}

extension UICollectionView {
    
    func setEmptyView(itemCount: Int, title: String, message: String) {
        if itemCount == 0 {
            // Show emptyView
            let rect = CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height)
            let emptyView = EmptyView(frame: rect, title: title, message: message)
            
            self.backgroundView = emptyView
        } else {
            // Dismiss emptyView
            self.backgroundView = nil
        }
    }
}
