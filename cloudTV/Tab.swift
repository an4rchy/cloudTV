//
//  Tab.swift
//  cloudTV
//
//  Created by Arjun Penemetsa on 10/3/15.
//  Copyright © 2015 Arjun Penemetsa. All rights reserved.
//

import Foundation
import UIKit
import Parse

class Tab: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionCellReuseIdentifier: String = "collectionCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        


    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let edgeInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        print("******************* \(collectionView.tag)")
        return edgeInset
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if collectionView.tag == 1 {
            print(collectionView.contentInset)
            return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height)

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
        print(collectionView.contentInset)
        print(collectionView.frame.size)
        let videoID: String = "3jAlg5BnYUU"
        performSegueWithIdentifier("DescriptionSegue", sender: videoID)
    
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DescriptionSegue" {
            
            let destinationVC = segue.destinationViewController as! DescriptionVC
            destinationVC.videoID = sender as! String
            
        }
    }
    
    
  
    
}
