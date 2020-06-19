//
//  HeaderView.swift
//  YoboredTask
//
//  Created by Jeel Shah on 19/06/20.
//  Copyright © 2020 Jeel Shah. All rights reserved.
//

import UIKit

class HeaderView: UIView
{
    //MARK:- Properties
    let title: UILabel = {
        let label = UILabel()
        label.text = "YOBORED"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK:- Methods
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
        addSubview(title)
        
        title.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        title.widthAnchor.constraint(equalToConstant: 160).isActive = true
        title.heightAnchor.constraint(equalToConstant: 50).isActive = true
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
