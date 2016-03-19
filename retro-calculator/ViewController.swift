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
        
        outputLbl.text = ""

    }
    
    @IBAction func numberPressed(btn: UIButton) {
        playSound()
        
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }

    @IBAction func onDividedPressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }

    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Substract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualsPressed(sender: AnyObject) {
        processOperation(Operation.Equals)
    }
    
    func processOperation(op: Operation) {
        playSound()
        
        if currentOperation != Operation.Empty {
            //run some math
        } else {
            //This is the first time an operatior has been pressed
        }
    }
    
    func playSound(){
        if btnSound.playing {
            btnSound.stop()
        }
        
        btnSound.play()
    }
}

