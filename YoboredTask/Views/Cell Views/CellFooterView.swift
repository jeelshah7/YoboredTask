//
//  CellFooterView.swift
//  YoboredTask
//
//  Created by Jeel Shah on 19/06/20.
//  Copyright © 2020 Jeel Shah. All rights reserved.
//

import UIKit


class CellFooterView: UIView
{
    //MARK:- Properties
    let stackView = UIStackViewFactory(axis: .horizontal, distribution: .fillEqually)
        .build()
    
    let viewsButton = UIButtonFactory(image: UIImage(systemName: "eye")!, title: "Views")
        .build()
    let commentsButton = UIButtonFactory(image: UIImage(systemName: "message.fill")!, title: "Comments")
        .build()
    let upvotesButton = UIButtonFactory(image: UIImage(systemName: "chevron.up")!, title: "Upvotes")
        .build()
    let saveButton = UIButtonFactory(image: UIImage(systemName: "bookmark.fill")!, title: "Save")
        .build()
    let shareButton = UIButtonFactory(image: UIImage(systemName: "square.and.arrow.up")!, title: "Share")
        .build()
    
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
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        stackView.addArrangedSubview(viewsButton)
        stackView.addArrangedSubview(commentsButton)
        stackView.addArrangedSubview(upvotesButton)
        stackView.addArrangedSubview(saveButton)
        stackView.addArrangedSubview(shareButton)
    }
}
