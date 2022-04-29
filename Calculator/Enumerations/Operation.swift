//
//  Enumeration.swift
//  Calculator
//
//  Created by Кирилл  Геллерт on 13.04.2022.
//

import Foundation

enum Operation: String {
    
    case reset
    case plusMinus = "⁺∕₋"
    case percent = "％"
    case divide = "÷"
    case multiply = "×"
    case minus = "-"
    case plus = "+"
    case equal = "="
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
    
    var isSelectable: Bool {
        switch self {
        case .divide, .multiply, .minus, .plus, .xY, .sqrtY, .ee:
            return true
        default:
            return false
        }
    }
    
    var isDeselectable: Bool {
        switch self {
        case .twoNd:
            return true
        default:
            return false
        }
    }
    
    var buttonShouldDeselectOther: Bool {
        switch self {
        case _ where isSelectable:
            return true
        case .number:
            return true
        default:
            return false
        }
    }
    
//    var relatedOperationForDeselect: [Operation: [Operation]] {
//        switch self {
//        case <#pattern#>:
//            <#code#>
//        default:
//            <#code#>
//        }
//    }
    
}





