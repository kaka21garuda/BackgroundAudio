//
//  ViewController.swift
//  BackgroundAudio
//
//  Created by Buka Cakrawala on 10/14/16.
//  Copyright © 2016 Buka Cakrawala. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
   var audioPlayer = AVAudioPlayer()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sample", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            
            var audioSession = AVAudioSession.sharedInstance()
            
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                print("AVAudioSession Category Playback OK")
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }

        } catch {
            print(error)
        }
        
        
       
        
    
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func play(_ sender: AnyObject) {
        audioPlayer.play()
        
        
    }
    
    @IBAction func pause(_ sender: AnyObject) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        } else {
            print("Audio is not playing!")
        }
    }


    @IBAction func restart(_ sender: AnyObject) {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        }
        audioPlayer.currentTime = 0
        audioPlayer.play()
    }

}



