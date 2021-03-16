//
//  Utilities.swift
//  customauth
//
//  Created by Christopher Ching on 2019-05-09.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import Foundation
import UIKit

enum loginType {
    case Facebook
    case Google
    case Email
}

class Styling {
    
    static var loggedInUsing: loginType = .Email
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        let stackViewSpacing: CGFloat = 10
        let margin: CGFloat = 45
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let textFieldWidth = screenWidth - (margin * 2)
        
        bottomLine.frame = CGRect(x: (-1 * margin) + stackViewSpacing, y: textfield.frame.height + 4, width: textFieldWidth/*textfield.frame.width*/, height: 2)
        
        //bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        bottomLine.backgroundColor = K.Colors.textFieldLine
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        button.backgroundColor = K.Colors.buttonBackground
        button.layer.cornerRadius = K.Numbers.buttonCornerRadius
        button.tintColor = K.Colors.buttonTint
    }
    
}
