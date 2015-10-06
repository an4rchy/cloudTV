//
//  DescriptionVC.swift
//  cloudTV
//
//  Created by Arjun Penemetsa on 10/5/15.
//  Copyright © 2015 Arjun Penemetsa. All rights reserved.
//


import UIKit
import YouTubePlayer

class DescriptionVC : UIViewController, YouTubePlayerDelegate {
    
    
    
    var videoID: String = "default"
    var videoPlayer: YouTubePlayerView?
    var delegate = self
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoPlayer = view.viewWithTag(3) as? YouTubePlayerView
        videoPlayer!.delegate = self
        videoPlayer!.loadVideoID(videoID)
    }
    
    func playerQualityChanged(videoPlayer: YouTubePlayerView, playbackQuality: YouTubePlaybackQuality) {
        print("quality changed")

    }
    
    func playerReady(videoPlayer: YouTubePlayerView) {
        if videoPlayer.ready {
        videoPlayer.play()
        }

    }
    
    func playerStateChanged(videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
        print ("state changed")
    }
    
    

}