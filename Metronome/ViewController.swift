//
//  ViewController.swift
//  Metronome
//
//  Created by Brittany Austin on 3/24/16.
//  Copyright © 2016 Europa Software. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
    var tempo = 120.0
    var subdivision = 3.0
    var timer: NSTimer?
    var currentNote = 0
    
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let filePath = NSBundle.mainBundle().pathForResource("beep-07", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: filePath!)
        
        do
        {
            try audioPlayer = AVAudioPlayer(contentsOfURL: fileURL)
        }
        catch
        {
            NSLog("\(error)")
        }
        
        
        timer = NSTimer(timeInterval: (60 / tempo) / subdivision,
                        target: self,
                        selector: #selector(ViewController.playSound),
                        userInfo: nil,
                        repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
        timer?.fire()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playSound()
    {
        NSLog("\(NSDate())")
        audioPlayer?.play()
    }

}

