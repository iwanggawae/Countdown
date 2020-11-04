//
//  ViewController.swift
//  Countdown
//
//  Created by Moh Iwangga Kalih Syah Putra on 01/11/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var seconds = 30
    var timer = Timer ()
    var sfx = AVAudioPlayer()
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func slider(_ sender: UISlider)
    {
        seconds = Int (sender.value )
        label.text = String(seconds) + "seconds"
    }
    
   
    
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBAction func start(_ sender: Any)
    {
       
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
    }
    
    @objc func counter ()
    {
        seconds -= 1
        label.text = String(seconds) + "seconds"
        
        if (seconds == 0)
        {
            timer.invalidate()
            sfx.play()
            startOutlet.isHidden = false
        }
    }
    @IBOutlet weak var stopOutlet: UIButton!
    @IBAction func stop(_ sender: Any)
    {
        timer.invalidate()
        seconds = 30
        sliderOutlet.setValue(30, animated: true)
        label.text = "30 seconds"
        
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOutlet.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true )
        if (seconds == 0)  {
            startOutlet.isHidden = false
        } else {
            
        }
        
        do
        {
            sfx = try! AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "notKlik", ofType: "mp3")!))
        }
        // Do any additional setup after loading the view.
    }


}

