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
    
    var defaults = UserDefaults.standard
    var switchButton = "darkMode"
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       if (defaults.object(forKey: "darkMode") != nil) {
            switch1.isOn = defaults.bool(forKey: switchButton)
           
        }
        //changeTheme()
       
    }
    
   
    @IBAction func defaultPercentageSwitch(_ sender: UISwitch) {


    }
    
    @IBAction func darkThemeSwitch(_ sender: UISwitch) {
        
      //  changeTheme()
        defaults.set(switch1.isOn, forKey: switchButton)

    }
    



}

