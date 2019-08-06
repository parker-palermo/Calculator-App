//
//  ViewController.swift
//  calculator
//
//  Created by Parker Palermo on 7/30/19.
//  Copyright © 2019 Parker Palermo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var display: UILabel!
    var result:Double = 0.0
    var operatorSigns:[String] = []
    
    @IBAction func numberKeyHandler(_ sender: UIButton) {
        let userInput = sender.titleLabel!.text!
        if display.text! == "0" {
            display.text = userInput
        }
        else {
            display.text!.append(userInput)
        }
        }
    @IBAction func reset(_ sender: Any) {
        display.text = "0"
        result = 0.0
        operatorSigns = []
    }
    @IBAction func decimal(_ sender: Any) {
        if !display.text!.contains(".")
        {
        display.text!.append(".")
        }
    }
    
    
    @IBAction func signChanger(_ sender: Any) {
        if display.text!.first == "-" {
            display.text = String(display.text!.dropFirst())
        }
        else {
            display.text = "-" + (display.text!)
        }
    }
    
    @IBAction func operatorHandler(_ sender: UIButton) {
        if result != 0 {
            if (operatorSigns.count == 1) {
                switch operatorSigns.first ?? "" {
                case "+":
                    display.text = String(result + Double(display.text!)!)
                    operatorSigns.remove(at: 0)
                case "-":
                    display.text = String(result - Double(display.text!)!)
                    operatorSigns.remove(at: 0)
                case "x":
                    display.text = String(result * Double(display.text!)!)
                    operatorSigns.remove(at: 0)
                case "/":
                    if (display.text == "0") {
                        display.text = "Error"
                    }
                    else {
                        display.text = String(result / Double(display.text!)!)
                        operatorSigns.remove(at: 0)
                    }
                default:
                    operatorSigns = []
                }
            }
        }
        if display.text == "Error" {
            result = 0.0
        }
        else {
            result = Double(display.text!)!
            display.text = "0"
        }
        operatorSigns.append(sender.titleLabel!.text!)
        if operatorSigns.first == "=" {
            display.text = String(result)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
