//
//  CellHeaderView.swift
//  YoboredTask
//
//  Created by Jeel Shah on 19/06/20.
//  Copyright © 2020 Jeel Shah. All rights reserved.
//

import UIKit

class CellHeaderView: UIView
{
    // MARK:- Properties
    let userLabel = UILabelFactory(text: "userName")
        .textColor(with: .white)
        .build()
    
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle.fill")
        imageView.tintColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK:- Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        loadViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadViews()
    {
        addSubview(userImageView)
        addSubview(userLabel)
        
        userImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        userImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        userLabel.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 5).isActive = true
        userLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        userLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        userLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
