//
//  ViewController.swift
//  TimerApp
//
//  Created by IMCS2 on 2/10/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //intilization of variables
    
    var timer = Timer()
    var counterSec = 0
    var counterMin = 0
    var isRunning = false

    @IBOutlet weak var timerLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        timerLable.text = String(format: "%02d:%02d",counterMin, counterSec )
        
        
    }

    @IBAction func tenSecForward(_ sender: UIBarButtonItem) {
        print("right top")

        if isRunning{
        counterSec += 10
        }

    }

    @IBAction func tenSecBackward(_ sender: UIBarButtonItem) {
        print("left Top")

        if isRunning {
            if counterSec >= 10 {
                counterSec -= 10
            }else if counterMin >= 1 {
                    counterMin -= 1
                    counterSec += 50
            }else{
                counterSec = 0
            }
        }
    }



    @IBAction func pauseButton(_ sender: Any) {
        print("pause")
        timer.invalidate()
        isRunning = false
        
    }
    
    @IBAction func playButton(_ sender: Any) {
        print("play")
        
        if !isRunning{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
            isRunning = true
            
        }
        
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        print("reset")
        
        timer.invalidate()
        isRunning = false
        counterSec = 0
        counterMin = 0
        timerLable.text = String(format: "%02d:%02d",counterMin, counterSec )
        
        
        
    }
    
    
    @objc func  updateTimer()  {
        counterSec += 1

        if counterSec >= 60 {
            counterMin = counterMin + counterSec / 60
            counterSec = counterSec % 60
        }
        
        print(counterSec)
        
        timerLable.text = String(format: "%02d:%02d",counterMin, counterSec )
    }
    
}

