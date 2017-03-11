//
//  ViewController.swift
//  tippy
//
//  Created by Etnuh on 3/8/17.
//  Copyright © 2017 Rainman Technologies. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
   var settings = SettingsViewController()

    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    var fromSettingsSwitch = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fromSettingsSwitch = defaults.bool(forKey: settings.switchButton)
        changeTheme()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        billField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaults.synchronize()
    }
    
    
    @IBAction func onTap(_ sender: Any) {
       // view.endEditing(true)
    }
    
    @IBAction func calculate(_ sender: AnyObject) {
        
        let tipPercentages = [0.18,0.2,0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    func changeTheme() {
        
        if fromSettingsSwitch {
            
            view.backgroundColor = UIColor.lightGray
            tipLabel.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            tipControl.tintColor = UIColor.white
            
            defaults.synchronize()
        }
        else {
            
            view.backgroundColor = UIColor.white
            tipLabel.textColor = UIColor.gray
            totalLabel.textColor = UIColor.gray
            tipControl.tintColor = UIColor.blue
            defaults.synchronize()
        }
    }
    
    
    
    
}
