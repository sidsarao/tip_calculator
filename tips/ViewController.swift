//
//  ViewController.swift
//  tips
//
//  Created by Sid Sarao on 4/13/15.
//  Copyright (c) 2015 Sid Sarao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "0.00"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipOption = defaults.integerForKey("another_key_that_you_choose")
        
        if tipOption == NSNotFound {
            tipOption = 1 
        }
        
        tipControl.selectedSegmentIndex = tipOption
        onEditingChanged(self)
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        println(tip)
        var total = billAmount + tip
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        //tip = tip / 100
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        var defaults = NSUserDefaults.standardUserDefaults()

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

