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
    var topText: String!
    var bottomText: String!
    var origImage: UIImage!
    var memedImage: UIImage!
    
    // MARK: -
    // MARK: Initializer
    init(topText: String, bottomText: String, origImage: UIImage, memedImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.origImage = origImage
        self.memedImage = memedImage
    }
}