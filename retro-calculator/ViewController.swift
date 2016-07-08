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
    
    
    @IBOutlet weak var outputLbl: UILabel!
    
    
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation = CalcService.Operation.Empty
    var result = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AudioService.instance.soundFXPlayer = AudioService.instance.createPlayerWithUrl(AudioService.instance.btnUrl!)
        AudioService.instance.soundFXPlayer?.prepareToPlay()
    
        
        outputLbl.text = "0"

    }
    
    @IBAction func numberPressed(btn: UIButton) {
        playSound()
        
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }

    @IBAction func onDividedPressed(sender: AnyObject) {
        processOperation(CalcService.Operation.Divide)
    }

    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(CalcService.Operation.Multiply)
    }
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(CalcService.Operation.Substract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(CalcService.Operation.Add)
    }
    
    @IBAction func onEqualsPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    @IBAction func onClearPressed(sender: AnyObject) {
        playSound()
        
        runningNumber = ""
        rightValStr = ""
        leftValStr = ""
        currentOperation = CalcService.Operation.Empty
        result = ""
        
        outputLbl.text = "0"

    }
    
    
    func processOperation(op: CalcService.Operation) {
        playSound()
        
        if currentOperation != CalcService.Operation.Empty {
            //run some math
            
            //A user selected an operator, but then selected another opertor without first enter a number
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                switch currentOperation {
                case CalcService.Operation.Multiply:
                    result = CalcService.instance.multiply(leftValStr, numStrB: rightValStr)!
                    break
                case CalcService.Operation.Add:
                    result = CalcService.instance.add(leftValStr, numStrB: rightValStr)!
                    break
                case CalcService.Operation.Substract:
                    result = CalcService.instance.subtract(leftValStr, numStrB: rightValStr)!
                    break
                case CalcService.Operation.Divide:
                    result = CalcService.instance.divide(leftValStr, numStrB: rightValStr)!
                    break
                default:
                    break
                }
                
                leftValStr = result
                outputLbl.text = result
                
            }
            

            
            currentOperation = op
            
        } else {
            //This is the first time an operatior has been pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
    func playSound(){
        AudioService.instance.playCurrentSoundFX()
    }
}

