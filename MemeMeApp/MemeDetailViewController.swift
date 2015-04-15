//
//  MemeDetailViewController.swift
//  MemeMeApp
//
//  Created by Luis Matute on 4/14/15.
//  Copyright (c) 2015 Luis Matute. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailViewController: UIViewController {
    
    // MARK: -
    // MARK: Properties
    var meme: Meme!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    // MARK: -
    // MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bottomToolbar: UIToolbar!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    // MARK: -
    // MARK: Actions
    @IBAction func editMeme(sender: AnyObject) {
        let editorVC = self.storyboard?.instantiateViewControllerWithIdentifier("editorVC") as! MemeEditorViewController
        editorVC.meme = self.meme
        self.presentViewController(editorVC, animated: true, completion: nil)
    }
    @IBAction func deleteMeme(sender: AnyObject) {
        var confirmationAlert = UIAlertController(title: "Delete Meme", message: "Are you sure you want to delete this meme?", preferredStyle: UIAlertControllerStyle.Alert)
        
        // OK action
        confirmationAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {(action: UIAlertAction!) in
            // Deleting meme
            self.appDelegate.memes = self.appDelegate.memes.filter {$0._id != self.meme._id}
            self.navigationController?.popViewControllerAnimated(true)
        }))
        
        // Cancel action
        confirmationAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
        
        // Show Alert Message
        self.presentViewController(confirmationAlert, animated: true, completion: nil)
    }
    
    // MARK: -
    // MARK: View's Life Cycle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.imageView.image = meme.memedImage
        self.tabBarController?.tabBar.hidden = true
        self.navigationController?.navigationBar.tintColor = UIColor(red: 46/255, green: 189/255, blue: 89/255, alpha: 1.0)        
    }
    
    // MARK: -
    // MARK: Methods
}
