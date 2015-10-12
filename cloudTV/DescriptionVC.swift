//
//  DescriptionVC.swift
//  cloudTV
//
//  Created by Arjun Penemetsa on 10/5/15.
//  Copyright © 2015 Arjun Penemetsa. All rights reserved.
//


import UIKit
import YouTubePlayer
import Parse
import Alamofire

class DescriptionVC : UIViewController, YouTubePlayerDelegate {
    
    
    
    var videoID: String = "default"
    var videoPlayer: YouTubePlayerView?
    var delegate = self
    
//    func printData(object: AnyObject) -> NSData? {
//        let temp = object as! [PFObject]
//        var imgData: NSData?
//        print(object.objectId)
//        print(object["name"])
//        print(object["img"])
//        let image = object["img"] as! PFFile
//        image.getDataInBackgroundWithBlock {
//            (imageData: NSData?, error: NSError?) -> Void in
//            if error == nil {
//                imgData = imageData
//            }
//        }
//        return imgData
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.hidden = true
        videoPlayer = view.viewWithTag(3) as? YouTubePlayerView
        videoPlayer!.delegate = self
        videoPlayer!.loadVideoID(videoID)
      Alamofire.request(.GET, "http://www.yahoo.com")
        let query = PFQuery(className: "data")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                print(objects!.count)

                if let objects = objects as? [PFObject]! {
                    for object in objects {
                        print(object.objectId)
                        print(object["name"])
                        print(object["img"])
                        let img = object["img"] as! PFFile
                        img.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError? ) -> Void in
                            if error == nil {
                                if let imgD = imageData {
                                    let imge = UIImage(data: imgD)
                                    let temp: UIImageView = self.view.viewWithTag(5) as! UIImageView
                                    temp.image = imge
                                    
                                    
                                }
                            }
                        }
                    }
                }
                
            }
            else {
                print(error!.userInfo)
            }
        }
        
        
        
    }
    
    func playerQualityChanged(videoPlayer: YouTubePlayerView, playbackQuality: YouTubePlaybackQuality) {
        print("quality changed")

    }
    
    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("got here")
        super.unwindForSegue(unwindSegue, towardsViewController: subsequentVC)
    }
    
    func playerReady(videoPlayer: YouTubePlayerView) {
        if videoPlayer.ready {
//        videoPlayer.play()
        }

    }
    
    func playerStateChanged(videoPlayer: YouTubePlayerView, playerState: YouTubePlayerState) {
        print ("state changed")
    }
    
    

}