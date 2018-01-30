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
    var extended = false
    var exOp = ""
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var final: UILabel!
    
    
    @IBAction func buttonTouch(_ sender: UIButton) {
        let newText = (sender.titleLabel?.text)!
        if reset {
            result.text = newText
            final.text = ""
            reset = false
            extended = false
            exOp = ""
        } else {
            result.text = result.text! + newText
        }
        
    }
    
    @IBAction func basicOperation(_ sender: UIButton) {
        let newText = (sender.titleLabel?.text)!
        result.text = result.text! + " " + newText + " "
        
    }
    
    @IBAction func extendedOperation(_ sender: UIButton) {
        extended = true
        let newText = (sender.titleLabel?.text)!
        exOp = newText
        result.text = result.text! + " " + newText + " "
    }
    
    
    @IBAction func equals(_ sender: UIButton) {
        if extended {
            let parts = result.text?.components(separatedBy: " " + exOp + " ")
       
            var total = 0
            if exOp == "count" {
                total = (parts?.count)!
            } else if exOp == "avg" {
                var sum = 0
                for nums in parts! {
                    sum += Int(nums)!
                }
                total = sum / (parts?.count)!
            } 
                
                final.text = String(total)
                reset = true
            
        } else {
            let parts = result.text?.components(separatedBy: " ")
            let operation = parts![1]
            let first = Int(parts![0])!
            let second = Int(parts![2])!

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
}

