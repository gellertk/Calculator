//
//  ButtonType.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 22.04.2022.
//

import UIKit

enum ButtonType {
    
    case number
    case selfAction
    case action
    case engineering
    
    var backgroundColor: UIColor {
        switch self {
        case .number:
            return K.Color.numberButtonBackground
        case .selfAction:
            return K.Color.selfActionButtonBackground
        case .action:
            return K.Color.actionButtonBackground
        case .engineering:
            return K.Color.engineerButtonBackground
        }
    }
    
    var tintColor: UIColor {
        if self == .selfAction {
            return K.Color.selfActionButtonTitle
        }
        return K.Color.buttonTitle
    }
    
    var font: UIFont {
        
        var fontSize = K.Numeric.portraitButtonWidthHeight / 2
        
        switch self {
        case .number:
            fontSize = K.Numeric.portraitButtonWidthHeight / 2
        case .selfAction:
            fontSize = K.Numeric.portraitButtonWidthHeight / 2.3
        case .action:
            fontSize = K.Numeric.portraitButtonWidthHeight / 2
        case .engineering:
            fontSize = K.Numeric.portraitButtonWidthHeight / 3.2
        }
        
        if Orientation.isLandscape {
            fontSize /= 1.5
        }
        
        return .systemFont(ofSize: fontSize)
    }
}
