//
//  theme.swift
//  tippy
//
//  Created by Ty rainey on 3/19/17.
//  Copyright © 2017 Rainman Technologies. All rights reserved.
//

import Foundation
import UIKit

func switchTheme(view: UIView, isDarkMode: Bool) {
    
    var backgroundColor = UIColor.white
    var tintColor = UIColor.blue
    var textColor = UIColor.black
    
    if (isDarkMode) {
        backgroundColor = UIColor.black
        tintColor = UIColor.white
        textColor = UIColor.white
    } else {
        backgroundColor = UIColor.white
        
    }
    
    
    view.backgroundColor = backgroundColor
    view.tintColor = tintColor
    
    updateSubViews(view: view, textColor: textColor, isDarkMode: isDarkMode)
}

func updateSubViews(view: UIView, textColor: UIColor, isDarkMode: Bool) {
    for subView in view.subviews {
        if subView is UILabel {
            if let label = subView as? UILabel {
                label.textColor =  textColor
            }
        } else if subView is UITextView {
            if let textView = subView as? UITextView {
                textView.tintColor = textColor
            }
        }
    }
}
