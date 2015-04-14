//
//  SettingViewController.swift
//  tips
//
//  Created by Sid Sarao on 4/13/15.
//  Copyright (c) 2015 Sid Sarao. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    
    @IBOutlet var dafaultTipController: UISegmentedControl!
    
    @IBAction func ReturnPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)  //Returns back
    }
    
    @IBAction func onTap(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil) //Returns back as well :\
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        var tipOption = defaults.integerForKey("another_key_that_you_choose")
        
        if tipOption == NSNotFound {
            tipOption = 1
        }
        
        dafaultTipController.selectedSegmentIndex = tipOption
    }


    @IBAction func onTipChanged(sender: AnyObject) {
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(dafaultTipController.selectedSegmentIndex, forKey: "another_key_that_you_choose")
        defaults.synchronize()
    }
}
