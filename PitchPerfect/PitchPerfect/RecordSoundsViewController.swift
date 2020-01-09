//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by saturn9er on 16/08/2019.
//  Copyright © 2019 saturn9er. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setPreRecordingState()
    }
    
    @IBAction func recordButton(_ sender: Any) {
        recordAudio()
    }
    
    @IBAction func stopButton(_ sender: Any) {
        setPreRecordingState()
        audioRecorder.stop()
        deactivateAudioSession()
    }
    
    private func recordAudio() {
        setRecordingState()

        let filePath = getNewRecordFilePath()
        setSessionAudioCategory()
        startRecording(to: filePath)
    }
    
    private func setSessionAudioCategory() {
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
    }
    
    private func deactivateAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    private func startRecording(to filePath: URL) {
        try! audioRecorder = AVAudioRecorder(url: filePath, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    private func getNewRecordFilePath () -> URL {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordName = "voice.wav"
        let pathArray = [dirPath, recordName]
        
        return URL(string: pathArray.joined(separator: "/"))!
    }
    
    private func setPreRecordingState() {
        recordButton.isEnabled = true
        recordingLabel.text = "Tap to Record"
        stopButton.isEnabled = false
    }
    
    private func setRecordingState() {
        recordButton.isEnabled = false
        recordingLabel.text = "Recording..."
        stopButton.isEnabled = true
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("recording failed")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlaySoundViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    
}



