//
//  FooterView.swift
//  YoboredTask
//
//  Created by Jeel Shah on 18/06/20.
//  Copyright © 2020 Jeel Shah. All rights reserved.
//

import UIKit

class FooterView: UIView
{
    // MARK:- Properties
    let playPauseButton = UIButtonFactory(image: UIImage(systemName: "play.fill")!)
        .build()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.tintColor = UIColor.init(red: 2/255, green: 128/255, blue: 157/255, alpha: 1)
        slider.thumbTintColor = UIColor.init(red: 0, green: 147/255, blue: 167/255, alpha: 1)
        return slider
    }()
    
    let timeLeftLabel = UILabelFactory(text: "00:00")
        .fontSize(of: 12)
        .textColor(with: .white)
        .build()
    
    let timePassedLabel = UILabelFactory(text: "00:00")
        .fontSize(of: 12)
        .textColor(with: .white)
        .build()
    
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
        addSubview(slider)
        addSubview(playPauseButton)
        addSubview(timeLeftLabel)
        addSubview(timePassedLabel)
        
        playPauseButton.leftAnchor.constraint(equalTo: leftAnchor,constant: 5).isActive = true
        playPauseButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10).isActive = true
        playPauseButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        playPauseButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        timePassedLabel.leftAnchor.constraint(equalTo: playPauseButton.rightAnchor, constant: 5).isActive = true
        timePassedLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        timePassedLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
        timePassedLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        slider.leftAnchor.constraint(equalTo: timePassedLabel.rightAnchor, constant: 10).isActive = true
        slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        slider.widthAnchor.constraint(equalTo: widthAnchor, constant: -150).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 30).isActive = true

        timeLeftLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        timeLeftLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        timeLeftLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        timeLeftLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
