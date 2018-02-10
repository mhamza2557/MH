//
//  SecondViewController.swift
//  PitchPerfect
//
//  Created by Techsviewer on 12/3/17.
//  Copyright © 2017 Practice. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
    var recordingUrl:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Playback = \(self.recordingUrl)")
        setupAudio()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    enum ButtonType: Int { case slow = 0, fast, chipmunk, vader, echo, reverb }
    @IBAction func ButtonAction(_ sender: UIButton) {
        print(sender.tag)
        switch(ButtonType(rawValue: sender.tag)!) {
        case .echo:
            playSound(echo: true)
        case .fast:
            playSound(rate: 1.5)
        case .reverb:
            playSound(reverb: true)
        case .slow:
            playSound(rate: 0.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        }
        configureUI(.playing)
    }
    
   
}
