//
//  ViewController.swift
//  ProgressTest
//
//  Created by Thrace on 2/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    let progress = Progress(totalUnitCount: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    
    @IBAction func startCount(_ sender: Any) {
        
        progressView.progress = 0.0
        progress.completedUnitCount = 0
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            guard self.progress.isFinished == false else {
                timer.invalidate()
                return
            }
            
            self.progress.completedUnitCount += 1
            self.progressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
            
            self.progressLabel.text = "\(Int(self.progress.fractionCompleted * 100)) %"
            
        }
        
        
        
    }
}

