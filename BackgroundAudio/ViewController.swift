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
    
   
    var audioPlayer: AVAudioPlayer?
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "shelter", ofType: "mp3")!))
            audioPlayer?.prepareToPlay()
            print("preparation success")
            
            let audioSession = AVAudioSession.sharedInstance()
            
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                print("AVAudioSession Category Playback OK")
                
                do {
                    try audioSession.setActive(true)

                } catch let error as NSError{
                    print("setActive error")
                }
            
            
            } catch let error as NSError {
                print("***********************")
                print(error.localizedDescription)
            }

        } catch {
            print("##########################")
            print(error.localizedDescription)
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func play(_ sender: AnyObject) {
        print("play music")
        audioPlayer?.play()
        
        
    }
    
    @IBAction func pause(_ sender: AnyObject) {
        if (audioPlayer?.isPlaying)! {
            audioPlayer?.pause()
        } else {
            print("Audio is not playing!")
        }
    }


    @IBAction func restart(_ sender: AnyObject) {
        if (audioPlayer?.isPlaying)! {
            
            audioPlayer?.currentTime = 0
            audioPlayer?.play()
        } else {
            audioPlayer?.play()
        }
        
    }

}



