//
//  ViewController.swift
//  tippy
//
//  Created by Binwei Yang on 7/11/16.
//  Copyright (c) 2016 Binwei Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let pickerRow = defaults.integerForKey("default tip percent")
        
        tipControl.selectedSegmentIndex = pickerRow

        if (!billField.text.isEmpty) {
            calculateTip(self)
        }
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(sender: AnyObject) {
        let bill = (billField.text as NSString).doubleValue
        let tipPercents = [0.18, 0.2, 0.25]
        
        let tip = bill * tipPercents[tipControl.selectedSegmentIndex]
        
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

