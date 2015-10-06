//
//  Tab.swift
//  cloudTV
//
//  Created by Arjun Penemetsa on 10/3/15.
//  Copyright © 2015 Arjun Penemetsa. All rights reserved.
//

import Foundation
import UIKit

class Tab: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionCellReuseIdentifier: String = "collectionCell"
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {


        if collectionView.tag == 1 {
            return CGSizeMake(view.frame.size.width, collectionView.frame.size.height + 56)
            
        }
        return CGSizeMake(100,150)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionCellReuseIdentifier, forIndexPath: indexPath)
//        cell.backgroundColor = UIColor.blueColor()
        if collectionView.tag == 1 {
//        cell.frame.size = CGSizeMake(600, 100)
            print(cell.frame.size)
        let a = cell.viewWithTag(2) as! UIImageView
        let idx = indexPath.item + 1
//        print(cell.layoutMargins)
//        print(idx)
        a.image = UIImage(named: "r\(idx)")

        }
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return 5
        }
        else {
        return 200
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath)
        
        var videoID: String = "TZUoD3y8j98"
        performSegueWithIdentifier("DescriptionSegue", sender: videoID)
    
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DescriptionSegue" {
            
            let destinationVC = segue.destinationViewController as! DescriptionVC
            destinationVC.videoID = sender as! String
            
        }
    }
    
    
  
    
}
