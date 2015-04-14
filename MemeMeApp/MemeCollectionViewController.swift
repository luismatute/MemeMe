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
    var memes: [Meme]!
    let applicationDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    // MARK: -
    // MARK: View's Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateMemes()
        self.tabBarController?.tabBar.tintColor = UIColor(red: 46/255, green: 189/255, blue: 89/255, alpha: 1.0)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.updateMemes()
        self.tabBarController?.tabBar.hidden = false
        self.collectionView?.reloadData()
    }
    override func viewDidAppear(animated: Bool) {
        if (self.memes.count == 0) {
            self.showEditor()
        }
    }
    
    // MARK: -
    // MARK: Collection View Data Source Protocol
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        // Instantiating Reusable Cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("memeContentCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        
        // Get the meme for this row
        let meme = self.memes[indexPath.row]
        
        // Set the cell properties
        cell.imageView?.image = meme.memedImage
        
        // Return the cell
        return cell
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // Instantiating the Meme Detail VC
        let memeDetailVC = self.storyboard?.instantiateViewControllerWithIdentifier("memeDetailVC") as! MemeDetailViewController
        
        // Getting the meme selected
        memeDetailVC.meme = self.memes[indexPath.row]
        
        // Pushing the memeDetailVC to the navigation stack
        self.navigationController?.pushViewController(memeDetailVC, animated: true)

    }
    
    // MARK: -
    // MARK: Actions
    @IBAction func addMeme(sender: AnyObject) {
        self.showEditor()
    }
    
    // MARK: -
    // MARK: Methods
    func updateMemes() {
        // Set memes to whatever is on the app delegate
        self.memes = applicationDelegate.memes
    }
    func showEditor() {
        // Getting the instance of the editor VC
        let editorVC = self.storyboard?.instantiateViewControllerWithIdentifier("editorVC") as! MemeEditorViewController
        
        // Showing the editorVC
        self.presentViewController(editorVC, animated: true, completion: nil)
    }
    
}
