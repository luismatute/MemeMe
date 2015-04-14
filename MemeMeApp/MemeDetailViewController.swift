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
    var meme: Meme?
    
    // MARK: -
    // MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!

    // MARK: -
    // MARK: View's Life Cycle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
}
