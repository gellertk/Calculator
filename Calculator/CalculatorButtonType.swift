//
//  Enumeration.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

enum CalculatorButtonDesign {
    
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
}

enum CalculatorButtonType: String {
    
    case reset = "AC"
    case plusMinus = "plus.forwardslash.minus"
    case percent
    case divide
    case multiply
    case minus
    case plus
    case equal
    case number
    case engineering
    
    var imageName: String {
        return rawValue
    }
    
    var design: CalculatorButtonDesign {
        switch self {
        case .reset, .plusMinus, .percent:

            return .selfAction
        case .divide, .multiply, .minus, .plus, .equal:
            
            return .action
        case .number:
            
            return .number
        case .engineering:
            
            return .engineering
        }
    }
    
}
