//
//  ViewController.swift
//  tippy
//
//  Created by Etnuh on 3/8/17.
//  Copyright © 2017 Rainman Technologies. All rights reserved.
//

import UIKit


class TipViewController: UIViewController, UITextFieldDelegate {
    
   var settings = SettingsViewController()

    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    let tipPercentages = [0.18,0.2,0.25]
    
    var switchOn = false
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let defaults = UserDefaults.standard
        
        switchOn = defaults.bool(forKey: settings.switchButton)
        
        if tipControl != nil {
            
            tipControl.selectedSegmentIndex = defaults.integer(forKey: settings.segSwitchButton)
            
        }
        else
        {
            tipControl.isEnabledForSegment(at: 0)
        }
        
        changeTheme()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        billField.becomeFirstResponder()
     


    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    
        
        loadDefaults()
        
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = NSLocale.current
        tipLabel.text = formatter.string(from: 0)
        totalLabel.text = formatter.string(from: 0)
        
       
        let billFieldPlaceholder = NSLocale.current.currencySymbol
        self.billField!.placeholder = billFieldPlaceholder
        
    
        defaults.synchronize()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        billField.transform = __CGAffineTransformMake(1.5, 1.5, 1.5, 1.5, 1.5, 1.5)
    }
    
    
    @IBAction func onTap(_ sender: Any) {
       // view.endEditing(true)
    }
    
    @IBAction func calculate(_ sender: AnyObject) {
        updateTip()

        
    }
        
        func changeTheme() {
            
            if switchOn {
                
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
    

    
    func loadDefaults() {
        let defaults = UserDefaults.standard
        billField.text = defaults.object(forKey: "billField") as? String
        
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTip()

    }

    func updateTip() {
        let tipPercentages = [0.18,0.2,0.25]
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = NSLocale.current
        
        let bill = Double(formatter.number(from: String(billField.text!)) ?? 0.0)
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        formatter.numberStyle = .currency
        tipLabel.text = formatter.string(from: NSNumber(value: tip))
        totalLabel.text = formatter.string(from: NSNumber(value: total))
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let defaults = UserDefaults.standard
        defaults.set(billField.text, forKey: "billField")
        defaults.synchronize()
    }
}
