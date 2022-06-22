//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func keyPressed(_ sender: UIButton) {
        sender.layer.opacity = 0.25
        self.playSound(tag: sender.tag)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            sender.layer.opacity = 1.0
        }
    }
    
    func toggleBackground(_ button: UIButton) {
        button.layer.opacity = 1.0
    }
    
    func playSound(tag: Int) {
        
        var name : String = "C"
        
        switch tag {
        case 1:
            name = "C"
        case 2:
            name = "D"
        case 3:
            name = "E"
        case 4:
            name = "F"
        case 5:
            name = "G"
        case 6:
            name = "A"
        case 7:
            name = "B"
        default:
            name = "C"
        }
        
        print("playing: \(name)")
        let url = Bundle.main.url(forResource: name, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
        //        guard let path = Bundle.main.path(forResource: name, ofType: "wav") else {
        //            return
        //        }
        //
        //        let url = URL(fileURLWithPath: path)
        
        //        do {
        
        //            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        //
        //            try AVAudioSession.sharedInstance().setActive(true)
        
        //            player = try AVAudioPlayer.init(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
        //
        //            guard let player = player else {return}
        
        //            player = try! AVAudioPlayer(contentsOf: url)
        //
        //            player.play()
        //
        //        } catch let error {
        //            print(error.localizedDescription)
        //        }
    }
    
}

