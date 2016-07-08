//
//  CalcService.swift
//  retro-calculator
//
//  Created by Bruce Burgess on 7/5/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import Foundation

class CalcService {
    static let instance = CalcService()
    
    enum Operation: String{
        case Divide = "/"
        case Multiply = "*"
        case Substract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    func multiply(numbStrA: String, numStrB: String ) -> String? {
        
        if let numA = Double(numbStrA), let numB = Double(numStrB) {
            return "\(numA * numB)"
        } else {
            return nil
        }
    }
    
    func divide(numbStrA: String, numStrB: String ) -> String? {
        if let numA = Double(numbStrA), let numB = Double(numStrB) {
            return "\(numA / numB)"
        } else {
            return nil
        }
    }
    
    func subtract(numbStrA: String, numStrB: String ) -> String? {
        if let numA = Double(numbStrA), let numB = Double(numStrB) {
            return "\(numA - numB)"
        } else {
            return nil
        }
    }
    
    func add(numbStrA: String, numStrB: String ) -> String? {
        if let numA = Double(numbStrA), let numB = Double(numStrB) {
            return "\(numA + numB)"
        } else {
            return nil
        }
    }
    
    
    
}


//switch currentOperation {
//case CalcService.Operation.Multiply:
//    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
//    break
//case CalcService.Operation.Add:
//    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
//    break
//case CalcService.Operation.Substract:
//    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
//    break
//case CalcService.Operation.Divide:
//    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
//    break
//default: