//
//  StartViewController.swift
//  NobetciEczaneHtmlParse
//
//  Created by Türker Sandal on 30.05.2019.
//  Copyright © 2019 Türker Sandal. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var buttonPass: UIButton!
    @IBOutlet weak var progress : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        progress.isHidden = true
        
    }
    
    @IBAction func pass(_ sender: Any) {
        buttonPass.isHidden = true
        progress.isHidden = false
        progress.startAnimating()
    }
    
}
