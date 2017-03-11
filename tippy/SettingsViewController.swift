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


    @IBAction func saveButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var defaults = UserDefaults.standard
    var switchButton = "darkMode"
    

    override func viewDidLoad() {
        super.viewDidLoad()
       if (defaults.object(forKey: "darkMode") != nil) {
            switch1.isOn = defaults.bool(forKey: switchButton)
           
        }
       
       
    }
    
   
    @IBAction func defaultPercentageSwitch(_ sender: UISwitch) {


    }
    
    @IBAction func darkThemeSwitch(_ sender: UISwitch) {
        
     
        defaults.set(switch1.isOn, forKey: switchButton)

    }
    @IBAction func prepareForUnwind(_ segue:UIStoryboardSegue) {
        performSegue(withIdentifier: "dismiss", sender: self)
    }
    

    



}

