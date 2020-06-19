//
//  HomeViewController.swift
//  YoboredTask
//
//  Created by Jeel Shah on 18/06/20.
//  Copyright © 2020 Jeel Shah. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    // MARK:- Properties
    private let cellId = "cellId"
    private let cameraCellId = "cameraCellId"
    private var firstLayout = true
    
    private var videoURLs = [VideoURL]()
    
    private let headerView = HeaderView()
    private let footerView = FooterView()
    
    // MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(HomeViewCell.self, forCellWithReuseIdentifier: cellId)
        
        loadViews()
        networkOperation()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if firstLayout{
            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .bottom, animated: true)
            let seconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                let cell = self.collectionView.visibleCells.first as! HomeViewCell
                self.playVideo(player: cell.player)
                self.footerControls(player: cell.player)
            }
            firstLayout = false
        }
    }
    
    func loadViews()
    {
        collectionView.addSubview(headerView)
        collectionView.addSubview(footerView)
        
        headerView.topAnchor.constraint(equalTo: view.topAnchor,constant: 10).isActive = true
        headerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        footerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        footerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        footerView.slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .allEvents)
        footerView.playPauseButton.addTarget(self, action: #selector(playPauseButtonPressed), for: .touchUpInside)
    }
    
    // MARK:- CollectionView Methods
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeViewCell
        cell.url = URL(string: videoURLs[indexPath.row].media)!
        return cell
        
    }
    // Stop playing the video on the cell which has disappeared.
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? HomeViewCell{
            cell.player.pause()
        }
    }
    // Start playing the video which is present on visible cell.
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = Int(targetContentOffset.pointee.y/view.frame.height)
        let cell = collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! HomeViewCell
        playVideo(player: cell.player)
        footerControls(player: cell.player)
    }
    
    //MARK:- Helper Methods
    // Updates scrubber and time labels of the video.
    func footerControls(player: AVPlayer)
    {
        let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        let mainQueue = DispatchQueue.main
        _ = player.addPeriodicTimeObserver(forInterval: interval, queue: mainQueue, using: { [weak self] time in
            guard let currentItem = player.currentItem else {return}
            self?.footerView.slider.maximumValue = Float(currentItem.duration.seconds)
            self?.footerView.slider.minimumValue = 0
            self?.footerView.slider.value = Float(currentItem.currentTime().seconds)
            let timePassed = self?.getTimeString(from: currentItem.currentTime())
            let timeLeft = self?.getTimeString(from: currentItem.duration-currentItem.currentTime())
            self?.footerView.timePassedLabel.text = timePassed
            self?.footerView.timeLeftLabel.text = "-\(timeLeft ?? "00:00")"
        })
    }
    func getTimeString(from time: CMTime) -> String {
        let totalSeconds = CMTimeGetSeconds(time)
        let hours = Int(totalSeconds/3600)
        let minutes = Int(totalSeconds/60) % 60
        let seconds = Int(totalSeconds.truncatingRemainder(dividingBy: 60))
        if hours > 0 {
            return String(format: "%i:%02i:%02i", arguments: [hours,minutes,seconds])
        }else {
            return String(format: "%02i:%02i", arguments: [minutes,seconds])
        }
    }
    
    @objc func playPauseButtonPressed()
    {
        let cell = collectionView.visibleCells.first as! HomeViewCell
        togglePlayButton(cell: cell)
    }
    // Manually scrubbing the slider.
    @objc func sliderValueChanged(_ sender: UISlider)
    {
        if let cell = collectionView.visibleCells.first as? HomeViewCell{
            cell.player.seek(to: CMTimeMake(value: Int64(sender.value*1000), timescale: 1000))
        }
    }
    
    private func togglePlayButton(cell: HomeViewCell)
    {
        switch  cell.player.timeControlStatus{
        case .paused:
            playVideo(player: cell.player)
        case .playing:
            pauseVideo(player: cell.player)
        default:
            break;
        }
    }
    
    private func playVideo(player: AVPlayer)
    {
        player.play()
        footerView.playPauseButton.setImage(UIImage(systemName: "pause.fill")!, for: .normal)
    }
    
    private func pauseVideo(player: AVPlayer)
    {
        player.pause()
        footerView.playPauseButton.setImage(UIImage(systemName: "play.fill")!, for: .normal)
    }
}



//MARK:- Service Method
extension HomeViewController
{   // Currently get the urls from local file.
    func networkOperation()
    {
        if let path = Bundle.main.path(forResource: "FeedData", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let urls = try JSONDecoder().decode([VideoURL].self, from: data)
                self.videoURLs = urls
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
              } catch {
                print("Error decoding URLs:-",error)
              }
        }
    }
}
