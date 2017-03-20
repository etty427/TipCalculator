//
//  TipSettings.swift
//  tippy
//
//  Created by Ty rainey on 3/17/17.
//  Copyright © 2017 Rainman Technologies. All rights reserved.
//

import UIKit

class TipSettings: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var settingsSwitch: UISwitch!
    
    var settingsItem = ["Dark Theme","Set Currency"]
  
    let defaults = UserDefaults.standard
    var switchButtonOnCell = "newSwitch"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if (defaults.object(forKey: "newSwitch") != nil) {
            settingsSwitch.isOn = defaults.bool(forKey: switchButtonOnCell)
         }
 
    
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
     
              defaults.set(settingsSwitch.isOn, forKey: switchButtonOnCell)
        
     
        }
            
        
}


