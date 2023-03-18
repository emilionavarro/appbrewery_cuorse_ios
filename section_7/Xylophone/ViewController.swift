//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer?

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playNote(note: String) {
        do {
            let capitalizedNote = note.uppercased()
            guard let url = Bundle.main.url(forResource: capitalizedNote, withExtension: "wav") else { return }
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }

    }
    @IBAction func cKeyPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        guard let note = sender.titleLabel?.text else { return }
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            sender.alpha = 1
        })
        playNote(note: note)
        
    }
}

