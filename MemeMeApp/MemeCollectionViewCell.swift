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
    // MARK: Properties
    var _id: String?
    var meme: Meme?
    var vc: UICollectionViewController?
    let applicationDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    // MARK: -
    // MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var deleteButton: UIButton!
    
    // MARK: -
    // MARK: Class Methods
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        println(action)
        if action == "editAction:" { return true }
        if action == "deleteAction:" { return true }
        return false
    }
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    // MARK: -
    // MARK: Methods
    func editAction(sender: UIMenuController) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editorVC = storyboard.instantiateViewControllerWithIdentifier("editorVC") as! MemeEditorViewController
        editorVC.meme = self.meme
        self.vc?.presentViewController(editorVC, animated: true, completion: nil)
    }
    func deleteAction(sender: UIMenuController) {
        var confirmationAlert = UIAlertController(title: "Delete Meme", message: "Are you sure you want to delete this meme?", preferredStyle: UIAlertControllerStyle.Alert)
        
        // OK action
        confirmationAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {(action: UIAlertAction!) in
            // Deleting meme
            self.applicationDelegate.memes = self.applicationDelegate.memes.filter {$0._id != self.meme?._id}
            self.vc?.viewWillAppear(true)
        }))
        
        // Cancel action
        confirmationAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
        
        // Show Alert Message
        self.vc?.presentViewController(confirmationAlert, animated: true, completion: nil)
    }
}
