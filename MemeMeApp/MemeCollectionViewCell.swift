//
//  MemeCollectionViewCell.swift
//  MemeMeApp
//
//  Created by Luis Matute on 4/13/15.
//  Copyright (c) 2015 Luis Matute. All rights reserved.
//

import UIKit

class MemeCollectionViewCell: UICollectionViewCell {

    // MARK: -
    // MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        println(action)
        if action == "editAction" { return true }
        if action == "delete:" { return true }
        return false
    }
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
}
