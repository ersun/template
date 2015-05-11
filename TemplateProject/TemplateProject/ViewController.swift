//
//  ViewController.swift
//  TemplateProject
//
//  Created by Ersun Alkan on 06/05/15.
//  Copyright (c) 2015 EA. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate
{
    
    enum properties: String
    {
        case day_of_week = "day_of_week",low_celsius="low_celsius",condition="condition"
    }
   
    
    
    
    var response:JSON?
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
//        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//        
//        double width = self.collectionView.frame.size.width;
//        width /= 3;
//        [flowLayout setItemSize:CGSizeMake(width, 100)];
//        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
//        
//        [self.collectionView setCollectionViewLayout:flowLayout];

        
        let layout=UICollectionViewFlowLayout()
        let width=collection.frame.size.width
        layout.itemSize=CGSize(width: 50, height: 100)
        collection.collectionViewLayout=layout
        
        
        startRequest()
    }

    
    func startRequest()
    {
        
        MyAlamofire().request(.GET, "https://george-vustrey-weather.p.mashape.com/api.php?location=istanbul").responseJSON{
            (req, res, json, error) -> Void in
            self.response=JSON(json!)
            self.displayData()
        }
    }
    
    func displayData()
    {
        collection.reloadData()
    }
    
    
 
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collection.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! UICollectionViewCell
        let label = cell.viewWithTag(1) as! UILabel
        label.text = response![indexPath.row][properties.day_of_week.rawValue].stringValue
        println(self.collection.frame.size.width)
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let t = response
        {
            return t.count
        }
        else
        {
            return 0
        }
        
    }

//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//        if let t = response
//        {
//            return t.count
//        }
//        else
//        {
//            return 0
//        }
//    }
//    
// 
    

}

