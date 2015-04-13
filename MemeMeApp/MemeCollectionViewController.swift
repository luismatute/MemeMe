//
//  MemeCollectionViewController.swift.swift
//  MemeMeApp
//
//  Created by Luis Matute on 4/13/15.
//  Copyright (c) 2015 Luis Matute. All rights reserved.
//

import Foundation
import UIKit

class MemeCollectionViewController: UICollectionViewController, UICollectionViewDataSource {
    // Properties
    var memes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let applicationDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        self.memes = applicationDelegate.memes
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
}
