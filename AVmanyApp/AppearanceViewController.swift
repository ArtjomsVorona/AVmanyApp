//
//  AppearanceViewController.swift
//  AVmanyApp
//
//  Created by Artjoms Vorona on 01/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import UIKit

class AppearanceViewController: UIViewController {

    @IBOutlet weak var appearanceTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabelText()
    }
    
    @IBAction func openSettingsButtonTapped(_ sender: UIButton) {
        openSettings()
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func openSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, options: [:]) { (success) in
            }
        }
    }
    
    func setLabelText() {
        var text = "Unable to specify User Interface Style"
        if self.traitCollection.userInterfaceStyle == .dark {
            text = "Dark Mode is on. \nGo to settings if you would like to change to Light Mode."
        } else {
            text = "Light Mode is on. \nGo to settings if you would like to change to Dark Mode."
        }
        appearanceTextLabel.text = text
    }
}

extension AppearanceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
