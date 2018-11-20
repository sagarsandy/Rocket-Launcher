//
//  ViewController.swift
//  Rocket Launcher
//
//  Created by Sagar Sandy on 20/11/18.
//  Copyright © 2018 Sagar Sandy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // Interface builder elements/variables
    @IBOutlet weak var darkBlueBg: UIImageView!
    @IBOutlet weak var cloudView: UIView!
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var LaunchedLabel: UILabel!
    @IBOutlet weak var launchButton: UIButton!
    
    // user defined variables
    var player : AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Fetching sound file path
        let path = Bundle.main.path(forResource: "launchSound", ofType: "wav")
        let url = URL(fileURLWithPath: path!)
        
        // Preparing the player to load the sound file
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        
        
    }

    
    // Laucnh button click event
    @IBAction func launchButtonPressed(_ sender: Any) {
        
        // Hiding the default background view and power button
        launchButton.isHidden = true
        darkBlueBg.isHidden = true
        
        // Displaying the clouds
        cloudView.isHidden = false
        
        // Playing the sound effect
        player.play()
        
        // Rocket animation for launch effect
        UIView.animate(withDuration: 2, animations: {
            self.rocketImage.frame = CGRect(x: 0, y: -120, width: 375, height: 400)
        }) { (finished) in
            self.LaunchedLabel.isHidden = false
        }
    }
}

