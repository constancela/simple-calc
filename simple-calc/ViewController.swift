//
//  ViewController.swift
//  simple-calc
//
//  Created by iguest on 1/29/18.
//  Copyright © 2018 iGuest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var operation = ""
    var reset = false
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var final: UILabel!
    
    
    @IBAction func buttonTouch(_ sender: UIButton) {
        let newText = (sender.titleLabel?.text)!
        if reset {
            result.text = newText
            final.text = ""
            reset = false
        } else {
            result.text = result.text! + newText
        }
        
    }
    
    @IBAction func basicOperation(_ sender: UIButton) {
        let newText = (sender.titleLabel?.text)!
        result.text = result.text! + " " + newText
        
    }
    
    @IBAction func extendedOperation(_ sender: UIButton) {
    }
    
    
    @IBAction func equals(_ sender: UIButton) {
        let equation = result.text
        var operation = ""
        if equation?.range(of: "+") != nil {
            operation = "+"
        } else if equation?.range(of: "-") != nil {
            operation = "-"
        } else if equation?.range(of: "/") != nil {
            operation = "/"
        } else if equation?.range(of: "*") != nil {
            operation = "*"
        } else if equation?.range(of: "%") != nil {
            operation = "%"
        }
        
        var numbers = equation?.components(separatedBy: operation)
        let first = Int(numbers![0])!
        let second = Int(numbers![1])!
        
        var total = 0
        if operation == "+" {
            total = first + second
        } else if operation == "-" {
            total = first - second
        } else if operation == "/" {
            total = first / second
        } else if operation == "*" {
            total = first * second
        } else if operation == "%" {
            total = first % second
        }
        final.text = String(total)
        reset = true
        
        
        
    }
}

