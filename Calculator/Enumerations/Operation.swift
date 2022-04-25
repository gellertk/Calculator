//
//  Enumeration.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import UIKit

enum Operation: String {
    
    case reset
    case plusMinus = "plus.forwardslash.minus"
    case percent
    case divide
    case multiply
    case minus
    case plus
    case equal
    case number
    case leftBracket = "("
    case rightBracket = ")"
    case mc
    case mPlus = "m+"
    case mMinus = "m-"
    case mr = "mr"
    case twoNd = "2ⁿᵈ"
    case x2 = "x²"
    case x3 = "x³"
    case xY = "xʸ"
    case eX = "eˣ"
    case tenX = "10ˣ"
    case oneDivide = "¹⁄ₓ"
    case sqrt2 = "²√x"
    case sqrt3 = "∛x"
    case sqrtY = "ʸ√x"
    case ln
    case logTen = "log₁₀"
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
    case pi = "π"
    case rand = "Rand"
    
    var buttonTitle: String {
        return rawValue
    }
    
    var buttonImage: UIImage {
        
        var config: UIImage.SymbolConfiguration
        
        if Orientation.isPortrait {
            if self.buttonType == .selfAction {
                config = UIImage.SymbolConfiguration(pointSize: K.Numeric.portraitButtonWidthHeight / 2.8, weight: .semibold)
            } else {
                config = UIImage.SymbolConfiguration(pointSize: K.Numeric.portraitButtonWidthHeight / 2.5, weight: .bold)
            }
        } else {
            if self.buttonType == .selfAction {
                config = UIImage.SymbolConfiguration(pointSize: K.Numeric.portraitButtonWidthHeight / 2.8 / 1.5, weight: .semibold)
            } else {
                config = UIImage.SymbolConfiguration(pointSize: K.Numeric.portraitButtonWidthHeight / 2.5 / 1.5, weight: .bold)
            }
        }
        
        return UIImage(systemName: buttonTitle, withConfiguration: config) ?? UIImage()
    }
    
    var buttonType: ButtonType {
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
    
    var selectable: Bool {
        switch self {
        case .divide, .multiply, .minus, .plus, .twoNd, .xY, .sqrtY, .ee:
            return true
        default:
            return false
        }
    }
    
}





