//
//  ViewController.swift
//  retro-calculator
//
//  Created by Bruce Burgess on 3/19/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Operation: String{
        case Divide = "/"
        case Multiply = "*"
        case Substract = "-"
        case Add = "+"
        case Equals = "="
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundURL)
            btnSound.prepareToPlay()
        } catch  let err as NSError {
            print(err.debugDescription)
        }
        
        
        
    }
    
    @IBAction func numberPressed(btn: UIButton) {
        btnSound.play()
    }

    @IBAction func onDividedPressed(sender: AnyObject) {
        print("divide")
    }

    @IBAction func onMultiplyPressed(sender: AnyObject) {
        print("multipy")
    }
    @IBAction func onSubtractPressed(sender: AnyObject) {
        print("subtract")
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        print("add")
    }
    
    @IBAction func onEqualsPressed(sender: AnyObject) {
        print("equals")
    }
}

