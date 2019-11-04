//
//  AppInfoViewController.swift
//  AVmanyApp
//
//  Created by Artjoms Vorona on 01/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import UIKit

class AppInfoViewController: UIViewController {
    
    @IBOutlet weak var appInfoTextLabel: UILabel!
    @IBOutlet weak var appDescriptionLabel: UILabel!
    
    var infoText = ""
    let appDescriptionText = "This app is created as a homework project in \nRiga Coding School \nby \nArtjoms Vorona"

    override func viewDidLoad() {
        super.viewDidLoad()
        appInfoTextLabel.text = infoText
        appDescriptionLabel.text = appDescriptionText
    }

}
