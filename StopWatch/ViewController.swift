//
//  ViewController.swift
//  StopWatch
//
//  Created by 山本　憲 on 2018/09/08.
//  Copyright © 2018年 山本　憲. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var Counter = 0.0
    var Timer = Foundation.Timer()
    var IsPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = String(Counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didTouchPlayButton(_ sender: Any) {
        print("touch")
        if(IsPlaying) {
            return
        }
        playButton.isEnabled = false
        playButton.isEnabled = true
        Timer = Foundation.Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        IsPlaying = true
    }
    @IBAction func didTouchPauseButton(_ sender: Any) {
        playButton.isEnabled = true
        stopButton.isEnabled = false
        Timer.invalidate()
        IsPlaying = false
    }
    @IBAction func didTouchResetButton(_ sender: Any) {
        Timer.invalidate()
        IsPlaying = false
        Counter = 0
        timeLabel.text = String(Counter)
        playButton.isEnabled = true
        stopButton.isEnabled = true
    }
    
    @objc func UpdateTimer() {
        Counter = Counter + 0.1
        timeLabel.text = String(format: "%.1f", Counter)
    }

    
}

