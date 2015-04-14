//
//  MemeCollectionViewController.swift
//  MemeMeApp
//
//  Created by Luis Matute on 4/13/15.
//  Copyright (c) 2015 Luis Matute. All rights reserved.
//

import Foundation
import UIKit

class MemeCollectionViewController: UICollectionViewController, UICollectionViewDataSource {

    // MARK: -
    // MARK: Properties
    var memes: [Meme]?
    
    // MARK: -
    // MARK: View's Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let applicationDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        self.memes = applicationDelegate.memes
        self.tabBarController?.tabBar.tintColor = UIColor(red: 46/255, green: 189/255, blue: 89/255, alpha: 1.0)
    }
    
    // MARK: -
    // MARK: Collection View Data Source Protocol
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes!.count
    }
    
}
