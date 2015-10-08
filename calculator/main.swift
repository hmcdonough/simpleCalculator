//
//  main.swift
//  calculator
//
//  Created by Harry McDonough on 10/7/15.
//  Copyright © 2015 Harrison McDonough. All rights reserved.
//

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
}

func convert(incoming:String) -> Double {
    if incoming.rangeOfString("-") != nil {
        return NSNumberFormatter().numberFromString(incoming)!.doubleValue
    }
    return NSNumberFormatter().numberFromString(incoming)!.doubleValue
}

func factorial(incoming:Double) -> Double {
    if incoming <= 1 {
        return 1;
    } else {
        return incoming * factorial(incoming - 1)
    }
}

let firstInput = input()
var numbers = firstInput.componentsSeparatedByString(" ")

let calc = input()
if calc == "fact" {
    print("Result: " + String(factorial(convert(numbers[0]))))
} else if numbers.count == 1 {
    let firstNum = convert(numbers[0])
    let secondNum = convert(input())
    print("Result: ")
    switch calc {
        case "+":
            print(firstNum + secondNum)
        case "-":
            print(firstNum - secondNum)
        case "*":
            print(firstNum * secondNum)
        case "/":
            print(firstNum / secondNum)
        case "%":
            print(firstNum % secondNum)
        default:
            print("Unrecognized calculator command passed")
    }
} else {
    print("Result: ")
    switch calc {
        case "count":
            print(numbers.count)
        case "avg":
            var total = 0.0;
            for i in 0...(numbers.count - 1) {
                total += convert(numbers[i])
            }
            print(total / Double(numbers.count))
        default:
            print("Unrecognized calculator command passed")
    }
}
