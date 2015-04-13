//
//  imagePickerDelegate.swift
//  MemeMeApp
//
//  Created by Luis Matute on 4/13/15.
//  Copyright (c) 2015 Luis Matute. All rights reserved.
//

import Foundation
import UIKit

class imagePickerDelegate: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var vc: MemeEditorViewController?
    
    // Updates Image
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            vc?.imagePickerView.image = image
        }
        dismissImagePicker(picker)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissImagePicker(picker)
    }
    
    func dismissImagePicker (picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}