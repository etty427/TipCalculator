//
//  SettingsViewController.swift
//  tippy
//
//  Created by Etnuh on 3/8/17.
//  Copyright © 2017 Rainman Technologies. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var switchON : Bool = false
    var defaults = UserDefaults.standard
    var switchButton = "darkMode"
    var segSwitchButton = "defaultSwitch"
    
    @IBOutlet weak var percentButton: UISegmentedControl!
    @IBOutlet weak var switch1: UISwitch!

    @IBAction func saveButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (defaults.object(forKey: "darkMode") != nil) {
            
            switch1.isOn = defaults.bool(forKey: switchButton)
            
        }

        if defaults.object(forKey: "defaultSwitch") != nil {
        
        percentButton.selectedSegmentIndex = defaults.integer(forKey: segSwitchButton)
        
        }
        switch1.tintColor = UIColor.darkGray
        switch1.thumbTintColor = UIColor.darkGray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        

        
        
        let defaultTipPercent = defaults.integer(forKey: segSwitchButton)
            percentButton.selectedSegmentIndex = defaultTipPercent
    }
    
    
    @IBAction func darkThemeSwitch(_ sender: UISwitch) {
        
      // defaults.set(switch1.isOn, forKey: switchButton)
        
        if switch1.isOn{
            switchON = true
            defaults.set(switchON, forKey: "darkMode")
        }
        if switch1.isOn == false{
            switchON = false
            defaults.set(switchON, forKey: "darkMode")
        }
        
  
    }

    @IBAction func defaultPercentage(_ sender: UISegmentedControl) {
        
        defaults.set(percentButton.selectedSegmentIndex, forKey: "defaultSwitch")
        defaults.synchronize()
    }

    

}

