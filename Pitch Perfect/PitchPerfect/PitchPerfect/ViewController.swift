//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Techsviewer on 12/3/17.
//  Copyright © 2017 Practice. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioRecorderDelegate {
    
    @IBOutlet weak var RecordOutlet: UIButton!
    @IBOutlet weak var LabelOutlet: UILabel!
    @IBOutlet weak var StopOutlet: UIButton!
    
    var recorder:AVAudioRecorder!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.StopOutlet.isEnabled = false
        
    }
    
    @IBAction func RecordAction(_ sender: Any) {
        self.RecordOutlet.isEnabled = false
        self.StopOutlet.isEnabled = true
        self.LabelOutlet.text = "Recording in progress"
        
        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as! String
        let fileName = "recordedAudio.wav"
        let path = [dir,fileName]
        let url = URL(fileURLWithPath: path.joined(separator: "/"))
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        self.recorder = try! AVAudioRecorder(url: url, settings: [:])
        self.recorder.delegate=self
        self.recorder.isMeteringEnabled=true
        self.recorder.prepareToRecord()
        self.recorder.record()
    }
    
    

    
    @IBAction func StopAction(_ sender: Any) {
        self.StopOutlet.isEnabled = false
        self.RecordOutlet.isEnabled = true
        self.LabelOutlet.text = "Tap to record"
        let session = AVAudioSession.sharedInstance()
        try! session.setActive(false)
        self.recorder.stop()
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
            let url = recorder.url
            self.performSegue(withIdentifier: "record", sender: url)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "record"{
            let desk = segue.destination as! SecondViewController
            desk.recordingUrl = sender as! URL
        }
    }
}

