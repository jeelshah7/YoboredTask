//
//  HomeViewCell.swift
//  YoboredTask
//
//  Created by Jeel Shah on 18/06/20.
//  Copyright © 2020 Jeel Shah. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewCell: UICollectionViewCell
{
    // MARK:- Properties
    let headerView = CellHeaderView()
    let footerView = CellFooterView()
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    var url: URL!{
        didSet{
            setupPlayer()
        }
    }
    
    // MARK:- Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        playerLayer.removeFromSuperlayer()
    }
    
    private func loadViews()
    {
        addSubview(headerView)
        addSubview(footerView)
        headerView.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        headerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        footerView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -40).isActive = true
        footerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        footerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupPlayer()
    {
        player = AVPlayer(url: url)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = bounds
        playerLayer.videoGravity = .resizeAspect
        layer.addSublayer(playerLayer)
        bringSubviewToFront(headerView)
        bringSubviewToFront(footerView)
    }
}
