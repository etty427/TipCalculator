//
//  ColorExtension.swift
//  tippy
//
//  Created by Ty rainey on 3/10/17.
//  Copyright © 2017 Rainman Technologies. All rights reserved.
//
/*
import Foundation
import UIKit


extension UserDefaults {
    
    func colorForKey(_ key: String) -> UIColor {
        var color: UIColor?
        if let colorData = data(forKey: key) {
            
            color =  NSKeyedUnarchiver.unarchiveObject(with: colorData) as? UIColor
        }
        return color!
        
    }
    
    func setColor(_ color: UIColor?, forKey key: String) {
        var colorData: NSData?
        
        if let color = color {
            colorData = NSKeyedArchiver.archivedData(withRootObject: color) as NSData?
        }
        
        set(colorData, forKey: key)
    }
    
    
}
*/
