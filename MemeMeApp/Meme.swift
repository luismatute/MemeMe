//
//  Meme.swift
//  MemeMeApp
//
//  Created by Luis Matute on 4/13/15.
//  Copyright (c) 2015 Luis Matute. All rights reserved.
//

import Foundation
import UIKit

struct Meme {
    
    // MARK: -
    // MARK: Properties
    let _id: String!
    let topText: String!
    let bottomText: String!
    let origImage: UIImage!
    let memedImage: UIImage!
    
    // MARK: -
    // MARK: Initializer
    init(topText: String, bottomText: String, origImage: UIImage, memedImage: UIImage) {
        self._id = NSUUID().UUIDString // id that will help me remove Memes
        self.topText = topText
        self.bottomText = bottomText
        self.origImage = origImage
        self.memedImage = memedImage
    }
}