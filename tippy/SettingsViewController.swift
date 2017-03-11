//
//  SettingsViewController.swift
//  tippy
//
//  Created by Etnuh on 3/8/17.
//  Copyright © 2017 Rainman Technologies. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var tipSwitch: UISwitch!

    @IBAction func saveButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var defaults = UserDefaults.standard
    var switchButton = "darkMode"
    var tipSwitchButton = "defaultSwitch"
  

    override func viewDidLoad() {
        super.viewDidLoad()
       if (defaults.object(forKey: "darkMode") != nil) {
            switch1.isOn = defaults.bool(forKey: switchButton)
           
        }
       if (defaults.object(forKey: "defaultSwitch") != nil) {
            tipSwitch.isOn = defaults.bool(forKey: tipSwitchButton)
            
        }
       
        switch1.tintColor = UIColor.darkGray
        switch1.thumbTintColor = UIColor.darkGray
        tipSwitch.tintColor = UIColor.darkGray
        tipSwitch.thumbTintColor = UIColor.darkGray
    }
    
   
    @IBAction func defaultPercentageSwitch(_ sender: UISwitch) {
        
        defaults.set(tipSwitch.isOn, forKey:tipSwitchButton)
    }
    
    @IBAction func darkThemeSwitch(_ sender: UISwitch) {
        
       defaults.set(switch1.isOn, forKey: switchButton)
    }


    

}

