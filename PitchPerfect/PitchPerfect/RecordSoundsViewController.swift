//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Thrace on 4/24/22.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordingButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    enum RecordingState {
        case recording, notRecording
    }
    
    struct Alerts {
        static let DismissAlert = "Dismiss"
        static let RecordingDisabledTitle = "Recording Disabled"
        static let RecordingDisabledMessage = "You've disabled this app from recording your microphone. Check Settings."
        static let RecordingFailedTitle = "Recording Failed"
        static let RecordingFailedMessage = "Something went wrong with your recording."
        static let AudioRecorderError = "Audio Recorder Error"
        static let AudioSessionError = "Audio Session Error"
        static let AudioRecordingError = "Audio Recording Error"
        static let AudioFileError = "Audio File Error"
        static let AudioEngineError = "Audio Engine Error"
    }
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        configureUI(.notRecording)
    }

    @IBAction func recordButtonClicked(_ sender: UIButton!) {
        
        configureUI(.recording)
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()

        do {
            try session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        } catch {
            showAlert(Alerts.AudioSessionError, message: String(describing: error))
        }

        do {
            try audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        } catch {
            showAlert(Alerts.AudioRecorderError, message: String(describing: error))
        }
        
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopButtonSelected(_ sender: UIButton) {
        configureUI(.notRecording)
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setActive(false)
        } catch {
            showAlert(Alerts.AudioSessionError, message: String(describing: error))
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAuioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAuioURL
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if(flag == true) {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            showAlert(Alerts.AudioRecorderError, message: "Recording Error")
        }
        
    }
    
    // MARK:  ConfigureUI
    
    func configureUI(_ recordingState:  RecordingState) {
        switch (recordingState) {
        case .recording:
            recordingLabel.text = "Recording..."
            // disable record button
            recordingButton.isEnabled = false
            // enable stop button
            stopButton.isEnabled = true
        case .notRecording:
            recordingLabel.text = "Tap to Record"
            // enable record button
            recordingButton.isEnabled = true
            // disable stop button
            stopButton.isEnabled = false
        }
    }
    
    // MARK: showAlert
    
    func showAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Alerts.DismissAlert, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
