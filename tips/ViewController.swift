//
//  ViewController.swift
//  tips
//
//  Created by Karen Chau on 12/27/15.
//  Copyright © 2015 kchau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        tipLabel.text = formatter.stringFromNumber(0)
        totalLabel.text = formatter.stringFromNumber(0)
        
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        
        var tipPercentages = [0.18, 0.20, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text!).doubleValue
        
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        
        formatter.locale = NSLocale.currentLocale()
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

