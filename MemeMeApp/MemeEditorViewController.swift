//
//  ViewController.swift
//  MemeMeApp
//
//  Created by Luis Matute on 4/13/15.
//  Copyright (c) 2015 Luis Matute. All rights reserved.
//

import UIKit

class MemeEditorViewController: UIViewController {

    // MARK: -
    // MARK: Properties
    let inputDelegate = textInputDelegate()
    let imagePickerViewDelegate = imagePickerDelegate()
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let memeTextAttributes = [
        NSStrokeColorAttributeName : UIColor.blackColor(),
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName : -1.0
    ]
    
    // MARK: -
    // MARK: Outlets
    @IBOutlet weak var topText: UITextField!
    @IBOutlet weak var bottomText: UITextField!
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var toolbarCameraButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    // MARK: -
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup() // loads initial setup for view
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.toolbar.translucent = true
        self.subscribeToKeyboardNotification()
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.unsubscribeToKeyboardNotification()
    }
    
    // MARK: -
    // MARK: Methods
    func initialSetup() {
        // Text Fields Attributes Initialization
            self.topText.defaultTextAttributes    = memeTextAttributes
            self.bottomText.defaultTextAttributes = memeTextAttributes
            
            self.topText.text                     = "TOP"
            self.bottomText.text                  = "BOTTOM"

            self.topText.delegate                 = inputDelegate
            self.bottomText.delegate              = inputDelegate
        
            self.topText.textAlignment            = .Center
            self.bottomText.textAlignment         = .Center

            // Change border style here so that we can see them in the storyboard
            self.topText.borderStyle              = UITextBorderStyle.None
            self.bottomText.borderStyle           = UITextBorderStyle.None
        
        // Toolbar Buttons
            self.toolbarCameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
            self.shareButton.enabled = appDelegate.memes.count > 0
        
        // Setting the self as the viewcontroller for the delegate
            self.imagePickerViewDelegate.vc = self
            self.inputDelegate.vc = self
    }
    func keyboardWillShow(notification: NSNotification) {
        // Check if bottom text label started the notification
        if bottomText.isFirstResponder() {
            self.view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y += getKeyboardHeight(notification)
    }
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        // the bottom text field is editing
        if bottomText.editing {
            return keyboardSize.CGRectValue().height
        } else {
            return 0
        }
    }
    func subscribeToKeyboardNotification() {
        // Add observers to default notification center
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    func unsubscribeToKeyboardNotification() {
        // Remove observers from default notification center
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    func generateMemedImage() -> UIImage {
        // Generates Image combining the image with the top and bottom text
        
        // TODO: Hide the toolbar and navbar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.setToolbarHidden(true, animated: false)
        
        // Render view to image
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.view.drawViewHierarchyInRect(self.view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // TODO: Show the toolbar and navbar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.setToolbarHidden(false, animated: false)
        
        
        return memedImage
    }
    func save() {
        // Creates the meme
        var meme = Meme(topText: self.topText.text, bottomText: self.bottomText.text, origImage: imagePickerView.image!, memedImage: generateMemedImage())
        
        // Add it to the memes array from the App Delegate
        appDelegate.memes.append(meme)
    }
    
    // MARK: -
    // MARK: Actions
    @IBAction func pickImageFromAlbum(sender: AnyObject) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = imagePickerViewDelegate
        pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(pickerController, animated: true, completion: nil)
    }
    @IBAction func pickImageFromCamera(sender: AnyObject) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = imagePickerViewDelegate
        pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(pickerController, animated: true, completion: nil)
    }
    @IBAction func shareMeme(sender: AnyObject) {
        let memedImage = generateMemedImage()
        let activityVC = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        
        activityVC.completionWithItemsHandler = { (activity, success, items, error) in
            if !success {
                // Cancelled
                println("sharing cancelled")
                return
            }
            
            //Shared Successfully
            self.save()
            activityVC.dismissViewControllerAnimated(true, completion: nil)
        }
        
        self.presentViewController(activityVC, animated: true, completion: nil)
    }
    @IBAction func dismissModal(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

