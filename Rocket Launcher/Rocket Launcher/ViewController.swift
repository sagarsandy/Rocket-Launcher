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

    @IBOutlet weak var darkBlueBg: UIImageView!
    @IBOutlet weak var cloudView: UIView!
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var LaunchedLabel: UILabel!
    @IBOutlet weak var launchButton: UIButton!
    
    
    var player : AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "launchSound", ofType: "wav")
        let url = URL(fileURLWithPath: path!)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }


    @IBAction func launchButtonPressed(_ sender: Any) {
        cloudView.isHidden = false
        launchButton.isHidden = true
        darkBlueBg.isHidden = true
        player.play()
        
        UIView.animate(withDuration: 2, animations: {
            self.rocketImage.frame = CGRect(x: 0, y: -120, width: 375, height: 400)
        }) { (finished) in
            self.LaunchedLabel.isHidden = false
        }
    }
}

