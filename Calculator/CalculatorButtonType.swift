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
    
    var font: UIFont {
        switch self {
        case .number:
            return .systemFont(ofSize: 35)
        case .selfAction:
            return .systemFont(ofSize: 35)
        case .action:
            return .systemFont(ofSize: 35)
        case .engineering:
            return .systemFont(ofSize: 15)
        }
    }
}

enum CalculatorButtonType: String {
    
    case reset = "AC"
    case plusMinus = "⁺∕₋"
    case percent = "％"
    case divide = "÷"
    case multiply = "×"
    case minus = "−"
    case plus = "+"
    case equal = "="
    case number
    case leftBracket = "("
    case rightBracket = ")"
    case mc
    case mPlus = "m+"
    case mMinus = "m-"
    case mr = "mr"
    case twoNd = "2nd"
    case x2 = "x2"
    case x3 = "x3"
    case xY = "xY"
    case eX = "eX"
    case tenX = "10X"
    case oneDivide = "1/x"
    case sqrt2
    case sqrt3
    case sqrtY
    case ln
    case logTen
    case factorial = "x!"
    case sin
    case cos
    case tan
    case e
    case ee = "EE"
    case rad = "Rad"
    case sinh
    case cosh
    case tanh
    case pi
    case rand = "Rand"
    
    var title: String {
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
        default:
            
            return .engineering
        }
    }
    
}

