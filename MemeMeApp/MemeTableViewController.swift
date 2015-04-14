//
//  MemeTableViewController.swift
//  MemeMeApp
//
//  Created by Luis Matute on 4/14/15.
//  Copyright (c) 2015 Luis Matute. All rights reserved.
//

import Foundation
import UIKit

class MemeTableViewController: UITableViewController, UITableViewDataSource {
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
    // MARK: Table View Data Source Protocol
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes!.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("memeTableCell", forIndexPath: indexPath) as! UITableViewCell
        let meme = self.memes?.first
        
        cell.imageView?.image = meme!.memedImage
        cell.textLabel!.text = "\(meme!.topText) - \(meme!.bottomText)"

        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Instantiating the Meme Detail VC
        let memeDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("memeDetailVC") as! MemeDetailViewController
        
        // Getting the meme selected
        memeDetailVC.meme = self.memes?.first
        
        // Pushing the memeDetailVC to the navigation stack
        self.navigationController?.pushViewController(memeDetailVC, animated: true)
    }
    
    // MARK: -
    // MARK: Actions
    @IBAction func addMeme(sender: AnyObject) {
        let editorVC = self.storyboard?.instantiateViewControllerWithIdentifier("editorVC") as! MemeEditorViewController
        self.presentViewController(editorVC, animated: true, completion: nil)
    }
    
}
